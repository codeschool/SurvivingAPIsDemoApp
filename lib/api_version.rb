class ApiVersion
  def initialize(version)
    @version = version
  end

  def matches?(request)
    versioned_accept_header?(request) || version_one?(request)
  end

  private

    def versioned_accept_header?(request)
      accept = request.headers['Accept']
      accept && accept[/application\/vnd\.apocalypse\.#{@version}\+json/]
    end

    def version_one?(request)
      @version == 1 && unversioned_accept_header?(request)
    end

    def unversioned_accept_header?(request)
      accept = request.headers['Accept']
      accept.blank? || accept[/application\/vnd\.apocalypse/].nil?
    end

end
