module V1
  class VersionController < ApplicationController
    abstract!

    before_action :set_api_version

    def set_api_version
      @api_version = 'One'
    end
  end
end