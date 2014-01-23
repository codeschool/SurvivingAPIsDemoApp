class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate

  protected
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end
end

