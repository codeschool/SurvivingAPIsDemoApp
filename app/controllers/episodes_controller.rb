class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
    respond_to do |format|
      format.json { render json: @episodes, status: 200 }
      format.apocalypse
    end
  end

  def create
    episode = Episode.new(episode_params)

    respond_to do |format|
      if episode.save
        format.json { render json: episode, status: :created, location: episode }
        format.apocalypse { render json: params, status: :created }
      else
        format.json { render json: episode.errors, status: :unprocessable_entity }
        format.apocalypse { render text: 'booo', layout: false }
      end
    end
  end

  def update
    episode = Episode.find(params[:id])
    respond_to do |format|
      if episode.update(episode_params)
        format.json { render json: episode, status: 200 }
      else
        format.json { render json: episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    episode = Episode.find(params[:id])
    episode.destroy!
    #render nothing: true, status: 204 # :no_content
    # or
    head 204
  end

  private

    def episode_params
      params.require(:episode).permit(:title, :description)
    end
end
