class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password| 
      user = User.find_by( email: username)
      user.present? && user.valid_password?(password)
    end
  end
end
