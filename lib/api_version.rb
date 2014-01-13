class ApiVersion
  def initialize(version, default=false)
    @version, @default = version, default
  end

  def matches?(request)
    if @default
      # TODO: anyway to remove duplication ?
      request.headers['Accept'] = 'application/vnd.apocalypse.v2+json'
    else
      matches_version?(request)
    end
  end


  private

    def matches_version?(request)
      request.headers['Accept'].include?("application/vnd.apocalypse.#{@version}+json")
    end
end
