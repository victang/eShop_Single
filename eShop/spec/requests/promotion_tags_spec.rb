require 'rails_helper'

RSpec.describe "PromotionTags", :type => :request do
  describe "GET /promotion_tags" do
    it "works! (now write some real specs)" do
      get promotion_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
