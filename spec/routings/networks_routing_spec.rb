require 'rails_helper'

RSpec.describe "Networks", type: :routing do
  describe "GET /" do
    it "uses proper controller" do
      expect(get("/")).to route_to("networks#index")
    end
  end
end
