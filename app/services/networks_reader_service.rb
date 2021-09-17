class NetworksReaderService

  URL = "https://takehome.io/"
  NETWORKS = %w[twitter facebook instagram]
  
  def initialize
    @client_api = ClientApiService.new(url: URL)
  end

  def call
    response = {}
    NETWORKS.each do |network|
      response[network] = load_network_data(network)
    end
    response
  end

  private

    def load_network_data(network)
      @client_api.get(endpoint: network)
    end

end