module API
  class BaseController < ApplicationController
    abstract!
    before_action ->{ @remote_ip = request.headers['REMOTE_ADDR'] }

  end
end
