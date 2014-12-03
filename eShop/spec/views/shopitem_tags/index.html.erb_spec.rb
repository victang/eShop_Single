require 'rails_helper'

RSpec.describe "shopitem_tags/index", :type => :view do
  before(:each) do
    assign(:shopitem_tags, [
      ShopitemTag.create!(
        :shopitem_id => 1,
        :tag => "Tag"
      ),
      ShopitemTag.create!(
        :shopitem_id => 1,
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of shopitem_tags" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
