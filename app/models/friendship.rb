class Friendship < ApplicationRecord
  belongs_to :member
  belongs_to :friend, class_name: "Member"

  validates :member, :friend, presence: true

  after_create :create_reverse_friendship

  def create_reverse_friendship
    Friendship.skip_callback(:create, :after, :create_reverse_friendship)
    Friendship.create(member: self.friend, friend: self.member)
    Friendship.set_callback(:create, :after, :create_reverse_friendship)
  end
end
