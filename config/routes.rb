Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create, :index, :destroy], controller: "artist/songs"
  end

  resources :songs, only: [:show, :edit, :update, :index, :destroy]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]

  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
