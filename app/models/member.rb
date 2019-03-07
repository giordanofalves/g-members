require 'elasticsearch/model'

class Member < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_one :website, dependent: :destroy
  has_many :headings, through: :website,
                      after_add:    [ lambda { |a,c| a.__elasticsearch__.index_document } ],
                      after_remove: [ lambda { |a,c| a.__elasticsearch__.index_document } ]
  has_many :friendships
  has_many :friends,
            through: :friendships,
            class_name: 'Member'

  accepts_nested_attributes_for :website

  validates :name, :website, presence: true

  def not_friends
    unfriends_ids = (friends.pluck(:id) << id)
    Member.where.not(id: unfriends_ids)
  end

  def as_indexed_json(options = {})
    self.as_json(
      only: :name,
      include: {
        headings: {
          only: :content
        }
      }
    )
  end

  def self.elastic_search(query)
    self.__elasticsearch__.search(
      query: {
        multi_match: {
          query: query,
          fields: ['name', 'headings.content']
        }
      }
    ).results
  end

  # the ideia is pass the id of document indexed
  # and use the more_like_this function in elastic_search do return results
  def more_like_this
    Member.__elasticsearch__.search(
        query: {
          more_like_this: {
            fields: ['content'],
            like: [{ "_index": "headings",
                     "_type": "text",
                     "_id": self.id.to_s }]
          }
        }
    ).results
  end
end
