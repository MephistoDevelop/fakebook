# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar])
  end

  def new_session_path(_scope)
    new_user_session_path
  end
end
