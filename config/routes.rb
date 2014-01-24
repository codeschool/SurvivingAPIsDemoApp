BananaPodcast::Application.routes.draw do
  resources :episodes do
    get :preview, on: :collection
  end
end
