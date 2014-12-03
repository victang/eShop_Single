require 'rails_helper'

RSpec.describe "promotions/index", :type => :view do
  before(:each) do
    assign(:promotions, [
      Promotion.create!(
        :name => "Name",
        :descr => "MyText",
        :image => "Image",
        :active => false
      ),
      Promotion.create!(
        :name => "Name",
        :descr => "MyText",
        :image => "Image",
        :active => false
      )
    ])
  end

  it "renders a list of promotions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
