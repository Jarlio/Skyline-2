# made for handle all errors in a modular way
class ErrorController < ApplicationController
  # if an error is rise, redirect to this method (error_path(error_message))
  def show
    @message = params[:message]
  end
end
