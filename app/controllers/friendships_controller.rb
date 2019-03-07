class FriendshipsController < ApplicationController
  def create
    Friendship.create(friendship_params)
    redirect_to member_path(friendship_params[:member_id])
  end

  private

  def friendship_params
    params.require(:friendship).permit(:member_id, :friend_id)
  end
end
