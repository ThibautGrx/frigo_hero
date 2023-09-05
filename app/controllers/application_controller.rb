class ApplicationController < ActionController::Base
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
end
