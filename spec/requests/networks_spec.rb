require 'rails_helper'
require_relative 'mocked_data'

RSpec.describe "Networks", type: :request do
  describe "GET /" do

    it "returns 200" do
      allow_any_instance_of(NetworksReaderService).to receive(:call) { MockedData::NETWORKS }
      get "/"
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema("networks")
    end
    
  end

  describe "GET /parallel" do

    it "returns 200" do
      allow_any_instance_of(ParallelNetworksReaderService).to receive(:call) { MockedData::NETWORKS }
      get "/parallel"
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema("networks")
    end

  end
end
