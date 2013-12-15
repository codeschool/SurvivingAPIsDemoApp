class API::ZombiesController < ApplicationController
  def index
    @zombies = Zombie.all # remember, starting in Rails 4 this returns a chainable scope
    if weapon = params[:weapon]
      @zombies = @zombies.where(weapon: weapon)
    end
    render json: @zombies
  end
end
