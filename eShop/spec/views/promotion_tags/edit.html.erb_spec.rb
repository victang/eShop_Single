require 'rails_helper'

RSpec.describe "promotion_tags/edit", :type => :view do
  before(:each) do
    @promotion_tag = assign(:promotion_tag, PromotionTag.create!(
      :promotion_id => 1,
      :tag => "MyString"
    ))
  end

  it "renders the edit promotion_tag form" do
    render

    assert_select "form[action=?][method=?]", promotion_tag_path(@promotion_tag), "post" do

      assert_select "input#promotion_tag_promotion_id[name=?]", "promotion_tag[promotion_id]"

      assert_select "input#promotion_tag_tag[name=?]", "promotion_tag[tag]"
    end
  end
end
