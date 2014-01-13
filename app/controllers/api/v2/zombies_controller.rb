class API::V2::ZombiesController < ApplicationController
  def index
    respond_to do |format|
      format.apocalypse_v2 { render text: 'ok', status: 200 }
    end
  end

  def show
    zombie = Zombie.find(params[:id])
    respond_to do |format|
      format.apocalypse_v2 { render json: zombie, status: 200 }
    end
  end
end
