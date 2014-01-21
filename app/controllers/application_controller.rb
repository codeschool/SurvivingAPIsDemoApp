class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  protected

    def authenticate_user
      current_user || render_unauthorized
    end

    def current_user
      @current_user ||= User.find_by(auth_token: auth_token)
    end

    def auth_token
      request.headers['USER_AUTH_TOKEN']
    end

    def render_unauthorized
      head 401
    end
end

