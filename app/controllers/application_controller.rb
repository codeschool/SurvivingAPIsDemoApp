class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate

  protected

    def authenticate
      current_user || render_unauthorized
    end

    def current_user
      @current_user ||= begin
                          authenticate_or_request_with_http_token do |token, options|
                            User.find_by(auth_token: token)
                          end
                        end
    end

    def render_unauthorized
      head 401
    end
end

