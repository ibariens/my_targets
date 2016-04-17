class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login


  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def is_admin?
    current_user && current_user.admin
  end

  def must_be_admin
    unless is_admin?
      redirect_to login_path, alert: "Administrators only"
    end
  end
end
