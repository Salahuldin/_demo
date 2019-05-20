class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    projects_path
  end

  def user_not_authorized
    redirect_to projects_path, flash: {error: 'You are not authorized to access this page.'}
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[name email password password_confirmation role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
