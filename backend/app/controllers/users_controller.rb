class UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def index
  end

  def add_friend
    @user.friends << User.find(params[:friend_id])
    redirect_to action: "show"
  end
end