class API::ZombiesController < ApplicationController
  def index
    zombies = Zombie.all # remember, starting in Rails 4 this returns a chainable scope
    if weapon = params[:weapon]
      zombies = zombies.where(weapon: weapon)
    end
    render json: zombies, status: 200
  end

  def show
    zombie = Zombie.find(params[:id])
    render json: zombie, status: 200
  end
end
