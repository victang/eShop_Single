require 'rails_helper'

RSpec.describe "promotion_tags/new", :type => :view do
  before(:each) do
    assign(:promotion_tag, PromotionTag.new(
      :promotion_id => 1,
      :tag => "MyString"
    ))
  end

  it "renders new promotion_tag form" do
    render

    assert_select "form[action=?][method=?]", promotion_tags_path, "post" do

      assert_select "input#promotion_tag_promotion_id[name=?]", "promotion_tag[promotion_id]"

      assert_select "input#promotion_tag_tag[name=?]", "promotion_tag[tag]"
    end
  end
end
