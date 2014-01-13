class API::V2::ZombiesController < ApplicationController
  def index
    zombies = Zombie.all

    respond_to do |format|
      format.apocalypse_v2 { render json: zombies }
    end
  end

  def show
    zombie = Zombie.find(params[:id])

    respond_to do |format|
      format.apocalypse_v2 { render json: zombie }
    end
  end
end
