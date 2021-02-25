Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/redditstuff" => "pages#index"
    post "/spotifystuff" => "pages#spotify_get_access_token"
    post "/spotify_profile" => "pages#spotify_artist_search"
  end
end
