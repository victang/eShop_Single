require 'rails_helper'

RSpec.describe "ShopitemTags", :type => :request do
  describe "GET /shopitem_tags" do
    it "works! (now write some real specs)" do
      get shopitem_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
