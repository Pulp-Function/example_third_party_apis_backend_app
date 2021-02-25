class Api::PagesController < ApplicationController
  def index
    response = HTTP.get("https://www.reddit.com/r/programming/.json")
    data = response.parse
    render json: { children: data["data"]["children"] }
  end

  def spotify_get_access_token
    response = HTTP.post(
      "https://accounts.spotify.com/api/token",
      form: {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: Rails.application.credentials.spotify[:redirect_uri],
        client_id: Rails.application.credentials.spotify[:client_id],
        client_secret: Rails.application.credentials.spotify[:client_secret],
      },
    )
    render json: { message: response.parse }
  end

  def spotify_artist_search
    response = HTTP
      .headers("Authorization" => "Bearer #{params[:access_token]}")
      .get("https://api.spotify.com/v1/search?q=#{params[:artist]}&type=artist")
    render json: response.parse
  end
end
