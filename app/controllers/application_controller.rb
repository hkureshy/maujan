class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:account_update) do |user_params|
  		user_params.permit(:email, :password, :password_confirmation, :current_password)
  	end
  end
end
