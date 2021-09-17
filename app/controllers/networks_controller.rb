class NetworksController < ApplicationController
  def index
    network_reader_service = NetworksReaderService.new
    
    render json: network_reader_service.call, status: 200
    rescue StandardError => error
      render json: { errors: error.message }, status: :unprocessable_entity
  end
end
