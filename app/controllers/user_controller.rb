# the part of user functionality that deals with views, profiles and other stuff
# authentication functionality and create new user by sign up is used devise
class UserController < ApplicationController
  before_action :authenticate_user!

  def search_user
    @users = User.where("name LIKE ?", "%#{params[:name]}%")
    render :json => @users
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to user_profile_path(@user.username)
    else
      redirect_to root_path
    end
  end

  def show
    # set the time range of age input
    @end = Date.today.year - 12
    @start = @end - 100

    @user = User.find_by_username(params[:username])
    if @user.nil?
      render 'user/error'
    else
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:background, :avatar, :sex, :age, :description)
  end
end
