class API::V1::ZombiesController < ApplicationController
  respond_to :apocalypse_v1, :json

  def index
    @zombies = Zombie.all
    respond_with(@zombies)
  end

  def show
    zombie = Zombie.find(params[:id])
    respond_to do |format|
      format.apocalypse_v1 { render json: zombie, status: 200 }
    end
  end
end
