require "rails_helper"

RSpec.describe ShopitemTagsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shopitem_tags").to route_to("shopitem_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/shopitem_tags/new").to route_to("shopitem_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/shopitem_tags/1").to route_to("shopitem_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shopitem_tags/1/edit").to route_to("shopitem_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shopitem_tags").to route_to("shopitem_tags#create")
    end

    it "routes to #update" do
      expect(:put => "/shopitem_tags/1").to route_to("shopitem_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shopitem_tags/1").to route_to("shopitem_tags#destroy", :id => "1")
    end

  end
end
