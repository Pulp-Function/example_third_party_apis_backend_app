class Api::PagesController < ApplicationController
  def index
    response = HTTP.get("https://www.reddit.com/r/programming/.json")
    data = response.parse
    render json: { children: data["data"]["children"] }
  end
end
