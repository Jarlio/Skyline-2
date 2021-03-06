# application principal controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # devise configs to accept username
  # username is needed for users to be find by links
  # ex: localhost:3000/user/gabriel
  def configure_permitted_parameters
    added_attrs = %i[username name email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
