class EpisodesController < ApplicationController
  before_action :authenticate_or_request, only: :index
  before_action :authenticate, only: :show

  def index
    render json: [], status: 200
  end

  def show
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

    def render_unauthorized
      render json: 'Invalid credentials.', status: 401
    end
end
