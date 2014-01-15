module API
  module V1
    class ZombiesController < VersionController

      def index
        render text: "#{@remote_ip} Version #{@api_version}!"
      end
    end
  end
end

