class ApiVersion
  def initialize(version, default=false)
    @version, @default = version, default
  end

  def matches?(request)
    @default || matches_version?(request)
  end


  private

    def matches_version?(request)
      request.headers['Accept'].include?("application/vnd.apocalypse.#{@version}+json")
    end
end
