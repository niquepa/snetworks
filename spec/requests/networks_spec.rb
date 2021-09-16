require 'rails_helper'

RSpec.describe "Networks", type: :request do
  describe "GET /" do

    it "returns 200" do
      get "/"
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema("networks")
    end
  end
end
