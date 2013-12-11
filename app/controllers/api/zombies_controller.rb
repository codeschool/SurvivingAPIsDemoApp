class API::ZombiesController < ApplicationController
  def index
    render text: 'ok', layout: false
  end
end
