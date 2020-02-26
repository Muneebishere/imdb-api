Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
  	namespace :v1 do
      resources :films, only:[:index]
  		resources :movies, only:[:show, :index, :create]
  		resources :genres, only:[:index]
  		resources :celebrities, only:[:show, :index]
  		resources :watchlist_shows, only:[:index]
      resource :users, only: [:show, :update] do
        post :watchlist_shows_count
        get :watchlist_films_ids
        get :watchlist_seasons_ids
        get :watchlist_episodes_ids
        post :update_watchlist_shows
        post :remove_avatar
      end
      resources :tv_shows, only:[:show] do 
        resources :seasons, only:[:show] do
          resources :episodes, only:[:show]
        end
      end
  	end
  end

end
