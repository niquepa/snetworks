class NetworksController < ApplicationController
  def index
    response = { "twitter": [], "facebook": [], "instagram": [] }
    render json: response, status: 200
  end
end
