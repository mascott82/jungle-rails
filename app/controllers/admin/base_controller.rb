class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_BASIC_AUTH_USERNAME'].to_s &&
      password == ENV['HTTP_BASIC_AUTH_PASSWORD'].to_s
    end
  end

  def current_admin
    # Implement logic to retrieve the current admin user
    # For example, if you have an Admin model:
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end
end