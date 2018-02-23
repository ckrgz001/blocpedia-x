class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  def require_user
    if !users_signed_in?
      flash[:danger] = "You must be logged in to perform that action."
      redirect_to root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end


end