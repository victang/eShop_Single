require 'rails_helper'

RSpec.describe "shopitem_tags/new", :type => :view do
  before(:each) do
    assign(:shopitem_tag, ShopitemTag.new(
      :shopitem_id => 1,
      :tag => "MyString"
    ))
  end

  it "renders new shopitem_tag form" do
    render

    assert_select "form[action=?][method=?]", shopitem_tags_path, "post" do

      assert_select "input#shopitem_tag_shopitem_id[name=?]", "shopitem_tag[shopitem_id]"

      assert_select "input#shopitem_tag_tag[name=?]", "shopitem_tag[tag]"
    end
  end
end
