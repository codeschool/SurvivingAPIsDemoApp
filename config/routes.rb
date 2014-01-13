require 'api_version'

BananaPodcast::Application.routes.draw do
  namespace 'api', path: '/' do
    constraints ApiVersion.new('v1') do
      scope module: :v1 do
        resources :zombies
      end
    end

    constraints ApiVersion.new('v2') do
      scope module: :v2 do
        resources :zombies
      end
    end
  end
end
