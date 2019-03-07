require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Should Respond' do
    it { should respond_to(:member_id) }
    it { should respond_to(:friend_id) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe 'Associations' do
    it { should belong_to(:member) }
    it { should belong_to(:friend).class_name('Member') }
  end

  describe 'Validations' do
    it { should validate_presence_of(:member) }
    it { should validate_presence_of(:friend) }
  end
end
