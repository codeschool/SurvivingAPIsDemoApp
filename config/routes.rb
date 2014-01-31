BananaPodcast::Application.routes.draw do
  namespace :v1 do
    resources :zombies
  end

  namespace :v2 do
    resources :zombies
  end
end
