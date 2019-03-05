class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.belongs_to :member, index: true
      t.belongs_to :friend, index: true

      t.timestamps
    end
  end
end
