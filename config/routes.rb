BananaPodcast::Application.routes.draw do

=begin
  class Banana
    def self.call(mapper, options)
      mapper.namespace :api, path: '/', constraints: { subdomain: 'api' }
    end
  end

  concern :api, Banana
  resources :zombies, concerns: :api
=end

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :zombies
  end
end
