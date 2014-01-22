class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  protected

    def authenticate_user
      current_user || render_unauthorized
    end

    def current_user
      @current_user ||= begin
                          authenticate_with_http_basic do |username, password|
                            user = User.find_by(username: username)
                            user && user.authenticate(password)
                          end
                        end
    end

    def render_unauthorized
      head 401
    end
end

