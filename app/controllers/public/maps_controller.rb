class Public::MapsController < ApplicationController
  def index
    @maps_api_key = ENV["MAPS_API_KEY"]
  end
end
