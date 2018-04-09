# display welcome homepage for all types of users
class WelcomeController < ApplicationController
  def index
    render 'welcome/index'
  end
end
