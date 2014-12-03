require 'rails_helper'

RSpec.describe "promotion_tags/index", :type => :view do
  before(:each) do
    assign(:promotion_tags, [
      PromotionTag.create!(
        :promotion_id => 1,
        :tag => "Tag"
      ),
      PromotionTag.create!(
        :promotion_id => 1,
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of promotion_tags" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
