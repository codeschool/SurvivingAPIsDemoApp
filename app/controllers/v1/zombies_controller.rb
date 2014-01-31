module V1
  class ZombiesController < VersionController

    def index
      render json: "#{@remote_ip} Version #{@api_version}!", status: 200
    end
  end
end

