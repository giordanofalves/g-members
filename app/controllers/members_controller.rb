class MembersController < ApplicationController
  before_action :set_member, only: :show

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
    @member.build_website
  end

  def show
    @friendship = Friendship.new
  end

  def create
    @member = Member.create(member_params)
    redirect_to members_path
  end

  def search
    response = Member.find(params[:member_id]).more_like_this

    render json: {
      results: response.results,
      total: response.total
    }
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(
      :name,
      website_attributes: [:url, :url_shortened]
    )
  end
end
