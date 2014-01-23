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
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

    def render_unauthorized
      render json: 'Bad credentials', status: 401
    end
end
