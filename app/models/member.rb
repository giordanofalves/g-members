class Member < ApplicationRecord
  has_one :website, dependent: :destroy
  has_many :headings, through: :website
  has_many :friends, ->(member) { unscope(:where).where('friendships.member_id = :member_id OR friendships.friend_id = :member_id', member_id: member.id) },
           join_table: :friendships,
           class_name: 'Friendship'

  accepts_nested_attributes_for :website

  validates :website, presence: true
end
