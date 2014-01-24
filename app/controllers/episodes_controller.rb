class EpisodesController < ApplicationController
  before_action :authenticate_or_request, only: :index
  before_action :authenticate, only: :show
  before_action :authenticate_preview_realm, only: :preview
  before_action :authenticate_banana_realm, only: :edit

  def index
    render json: [], status: 200
  end

  def show
    render json: [], status: 200
  end

  def preview
    render json: [], status: 200
  end

  def edit
    render json: [], status: 200
  end

  protected

    def authenticate_or_request
      authenticate_or_request_with_http_basic do |username, password|
        User.authenticate(username, password)
      end
    end

    def authenticate
      authenticate_basic_auth || render_unauthorized
    end

    def authenticate_basic_auth
      authenticate_with_http_basic do |username, password|
        User.authenticate(username, password)
      end
    end

    def render_unauthorized(realm=nil)
      if realm
        self.headers['WWW-Authenticate'] = %(Basic realm="#{realm.gsub(/"/, "")}")
      end
      render json: 'Invalid credentials.', status: 401
    end

    def authenticate_preview_realm
      authenticate_or_request_with_http_basic('Preview') do |username, password|
        User.authenticate(username, password)
      end
    end

    def authenticate_banana_realm
      authenticate_basic_auth || render_unauthorized('Banana')
    end
end
