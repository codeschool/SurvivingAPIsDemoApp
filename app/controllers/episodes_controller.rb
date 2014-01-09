class EpisodesController < ApplicationController
  respond_to :apocalypse, :json

  def index
    @episodes = Episode.all
    respond_with(@episodes)
  end

  def create
    @episode = Episode.new(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render action: 'show', status: :created, location: @episode }
        format.apocalypse { render json: params, status: :created }
      else
        raise 'NO'
        format.html { render action: 'new' }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
        format.apocalypse { render text: 'booo', layout: false }
      end
    end
  end

  private

    def episode_params
      params.require(:episode).permit(:title, :description)
    end
end
