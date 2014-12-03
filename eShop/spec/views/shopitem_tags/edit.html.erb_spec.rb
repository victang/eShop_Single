require 'rails_helper'

RSpec.describe "shopitem_tags/edit", :type => :view do
  before(:each) do
    @shopitem_tag = assign(:shopitem_tag, ShopitemTag.create!(
      :shopitem_id => 1,
      :tag => "MyString"
    ))
  end

  it "renders the edit shopitem_tag form" do
    render

    assert_select "form[action=?][method=?]", shopitem_tag_path(@shopitem_tag), "post" do

      assert_select "input#shopitem_tag_shopitem_id[name=?]", "shopitem_tag[shopitem_id]"

      assert_select "input#shopitem_tag_tag[name=?]", "shopitem_tag[tag]"
    end
  end
end
