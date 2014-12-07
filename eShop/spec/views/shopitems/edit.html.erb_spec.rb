require 'rails_helper'

RSpec.describe "shopitems/edit", :type => :view do
  before(:each) do
    @shopitem = assign(:shopitem, Shopitem.create!(
      :code_name => "MyString",
      :short_name => "MyString",
      :long_name => "MyString",
      :stock => 1,
      :price => 1.5,
      :sales => 1,
      :active => false
      :image => "MyString",
      :descr => "MyText"
    ))
  end

  it "renders the edit shopitem form" do
    render

    assert_select "form[action=?][method=?]", shopitem_path(@shopitem), "post" do

      assert_select "input#shopitem_code_name[name=?]", "shopitem[code_name]"

      assert_select "input#shopitem_short_name[name=?]", "shopitem[short_name]"

      assert_select "input#shopitem_long_name[name=?]", "shopitem[long_name]"

      assert_select "input#shopitem_stock[name=?]", "shopitem[stock]"

      assert_select "input#shopitem_price[name=?]", "shopitem[price]"

      assert_select "input#shopitem_sales[name=?]", "shopitem[sales]"

      assert_select "input#shopitem_image[name=?]", "shopitem[image]"

      assert_select "textarea#shopitem_descr[name=?]", "shopitem[descr]"
    end
  end
end
