require 'rails_helper'

RSpec.describe "Shopitems", :type => :request do
  describe "GET /shopitems" do
    it "works! (now write some real specs)" do
      get shopitems_path
      expect(response).to have_http_status(200)
    end
  end
end
