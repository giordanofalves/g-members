require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  describe '#create' do
    let(:friendship) { build(:friendship) }

    before do
      expect(Friendship).to receive(:create).and_return(friendship)
      post :create, params: { friendship: friendship.attributes }
    end

    it 'redirect to index' do
      expect(response).to redirect_to(member_path(friendship[:member_id]))
    end

    it 'responses success' do
      expect(response).to have_http_status(302)
    end
  end
end
