class EpisodesController < ApplicationController
  skip_before_action :authenticate, only: :show
  before_action :authenticate_manual, only: :show

  def index
    render json: [], status: 200
  end

  def show
    render json: [], status: 200
  end

  protected
    def authenticate_manual
      token = ActionController::HttpAuthentication::Token.token_and_options(request).first
      user = User.find_by(auth_token: token)
      unless user
        render json: 'Bad credentials', status: 401 and return false
      end
    end
end
