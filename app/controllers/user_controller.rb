# the part of user functionality that deals with views, profiles and other stuff
# authentication functionality and create new user by sign up is used devise
class UserController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by_username(params[:username])
    if @user.nil?
      render 'user/error'
    else
      render 'show'
    end
  end
end
