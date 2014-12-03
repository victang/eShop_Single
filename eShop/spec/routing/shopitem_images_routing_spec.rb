require "rails_helper"

RSpec.describe ShopitemImagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shopitem_images").to route_to("shopitem_images#index")
    end

    it "routes to #new" do
      expect(:get => "/shopitem_images/new").to route_to("shopitem_images#new")
    end

    it "routes to #show" do
      expect(:get => "/shopitem_images/1").to route_to("shopitem_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shopitem_images/1/edit").to route_to("shopitem_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shopitem_images").to route_to("shopitem_images#create")
    end

    it "routes to #update" do
      expect(:put => "/shopitem_images/1").to route_to("shopitem_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shopitem_images/1").to route_to("shopitem_images#destroy", :id => "1")
    end

  end
end
