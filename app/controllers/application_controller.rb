class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nick_name])
  end
end
