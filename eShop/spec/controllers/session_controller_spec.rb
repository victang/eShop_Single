require 'rails_helper'

RSpec.describe SessionController, :type => :controller do

  describe "GET login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET logout" do
    it "returns http success" do
      get :logout
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET login_attempt" do
    it "returns http success" do
      get :login_attempt
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET profile" do
    it "returns http success" do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET setting" do
    it "returns http success" do
      get :setting
      expect(response).to have_http_status(:success)
    end
  end

end
