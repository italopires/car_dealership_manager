class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  private

  def user_not_authorized
    flash[:alert] = "Access Denied, you don't have permission to access this page."
    redirect_to root_path
  end
end
