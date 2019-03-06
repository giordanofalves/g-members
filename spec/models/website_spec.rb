require 'rails_helper'

RSpec.describe Website, type: :model do
  let(:website) { build(:website, :g1) }

  describe 'Should Respond' do
    it { should respond_to(:url) }
    it { should respond_to(:url_shortened) }
    it { should respond_to(:created_at) }
    it { should respond_to(:updated_at) }
  end

  describe 'Associations' do
    it { should belong_to(:member) }
    it { should have_many(:headings) }
  end

  describe 'Methods' do
    it '.shorten_url' do
      VCR.use_cassette('services/bitly/g1') do
        website.send(:shorten_url)
        expect(website.url_shortened).to eq('https://glo.bo/2EEtbTt')
      end
    end

    it '.map_headings' do
      VCR.use_cassette('sites/g1') do
        expect { website.send(:map_headings) }.to change{website.headings.size}.from(0).to(1)
        expect(website.headings.first.content).to eq('G1')
        expect(website.headings.first.heading_type).to eq('h1')
      end
    end
  end
end
