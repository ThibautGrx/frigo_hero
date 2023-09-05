class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def after_sign_in_path_for(_resource)
    items_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def record_not_found(_exception)
    render template: "pages/error_404", status: :not_found
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
        keys: [:username, :name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in,
        keys: [:login, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update,
        keys: [:username, :name, :email, :password_confirmation, :current_password])    end
end
