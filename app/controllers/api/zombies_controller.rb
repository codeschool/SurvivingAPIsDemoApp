class API::ZombiesController < ApplicationController
  def index
    @zombies = Zombie.all
    render json: @zombies
  end
end
