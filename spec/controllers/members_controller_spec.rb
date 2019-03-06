require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe '#index' do
    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'responses success' do
      expect(response).to be_success
    end
  end

  describe '#new' do
    before { get :new }

    it 'renders the index template' do
      expect(response).to render_template(:new)
    end

    it 'responses success' do
      expect(response).to be_success
    end
  end

  describe '#show' do
    let(:member) { create(:member) }

    before do
      allow_any_instance_of(Website).to receive(:shorten_url).and_return(nil)
      allow_any_instance_of(Website).to receive(:map_headings).and_return(nil)
      get :show, params: { id: member.id }
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'responses success' do
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:member) { build(:member) }

    before do
      expect(Member).to receive(:create).and_return(member)
      post :create, params: { member: { name: member.name } }
    end

    it 'redirect to index' do
      expect(response).to redirect_to(members_path)
    end

    it 'responses success' do
      expect(response).to have_http_status(302)
    end
  end
end
