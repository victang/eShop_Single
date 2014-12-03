require 'rails_helper'

RSpec.describe "ShopitemImages", :type => :request do
  describe "GET /shopitem_images" do
    it "works! (now write some real specs)" do
      get shopitem_images_path
      expect(response).to have_http_status(200)
    end
  end
end
