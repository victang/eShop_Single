require 'rails_helper'

RSpec.describe "shopitem_images/index", :type => :view do
  before(:each) do
    assign(:shopitem_images, [
      ShopitemImage.create!(
        :shopitem_id => 1,
        :image => "Image",
        :descr => "MyText"
      ),
      ShopitemImage.create!(
        :shopitem_id => 1,
        :image => "Image",
        :descr => "MyText"
      )
    ])
  end

  it "renders a list of shopitem_images" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
