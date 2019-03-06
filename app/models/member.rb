class Member < ApplicationRecord
  has_one :website, dependent: :destroy
  has_many :headings, through: :website
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
end
