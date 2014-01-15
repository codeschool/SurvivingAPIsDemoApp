module API
  module V2
    class VersionController < BaseController
      abstract!

      before_action :set_api_version

      def set_api_version
        @api_version = 'Two'
      end
    end
  end
end
