require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'Should Respond' do
    it { should respond_to(:name) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe 'Associations' do
    it { should have_one(:website) }
    it { should have_many(:headings).through(:website) }
    it { should have_many(:friends).class_name('Member') }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:website) }
  end

  describe 'Nested Attributes' do
    it { should accept_nested_attributes_for(:website) }
  end

  describe 'Methods' do
    let(:m1) { build(:member) }
    let(:m2) { build(:member) }

    before do
      m1.friends << m2
    end

    it '.not_friends' do
      expect(m1.friends).to include(m2)
      expect(m1.not_friends).to be_empty
    end
  end
end
