require 'rails_helper'

RSpec.describe Heading, type: :model do
  describe 'Should Respond' do
    it { should respond_to(:content) }
    it { should respond_to(:heading_type) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe 'Associations' do
    it { should belong_to(:website) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:heading_type) }
  end

  describe 'Enums' do
    it { should define_enum_for(:heading_type).with_values(%i[h1 h2 h3]) }
  end
end
