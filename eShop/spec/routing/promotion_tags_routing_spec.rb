require "rails_helper"

RSpec.describe PromotionTagsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/promotion_tags").to route_to("promotion_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/promotion_tags/new").to route_to("promotion_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/promotion_tags/1").to route_to("promotion_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/promotion_tags/1/edit").to route_to("promotion_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/promotion_tags").to route_to("promotion_tags#create")
    end

    it "routes to #update" do
      expect(:put => "/promotion_tags/1").to route_to("promotion_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/promotion_tags/1").to route_to("promotion_tags#destroy", :id => "1")
    end

  end
end
