class ParallelNetworksReaderService

  URL = "https://takehome.io/"
  NETWORKS = %w[twitter facebook instagram]

  def initialize
    @client_api = ClientApiService.new(url: URL)
    @threads = []
  end

  def call
    response = {}
    NETWORKS.each do |network|
      @threads << Thread.new do
        response[network] = load_network_data(network)
      end
    end
    @threads.each { |hilo| hilo.join }
    response
  end

  private

    def load_network_data(network)
      @client_api.get(endpoint: network)
    end

end