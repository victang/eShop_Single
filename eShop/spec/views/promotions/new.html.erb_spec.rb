require 'rails_helper'

RSpec.describe "promotions/new", :type => :view do
  before(:each) do
    assign(:promotion, Promotion.new(
      :name => "MyString",
      :descr => "MyText",
      :image => "MyString",
      :active => false
    ))
  end

  it "renders new promotion form" do
    render

    assert_select "form[action=?][method=?]", promotions_path, "post" do

      assert_select "input#promotion_name[name=?]", "promotion[name]"

      assert_select "textarea#promotion_descr[name=?]", "promotion[descr]"

      assert_select "input#promotion_image[name=?]", "promotion[image]"

      assert_select "input#promotion_active[name=?]", "promotion[active]"
    end
  end
end
