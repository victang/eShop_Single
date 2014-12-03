require 'rails_helper'

RSpec.describe "promotions/edit", :type => :view do
  before(:each) do
    @promotion = assign(:promotion, Promotion.create!(
      :name => "MyString",
      :descr => "MyText",
      :image => "MyString",
      :active => false
    ))
  end

  it "renders the edit promotion form" do
    render

    assert_select "form[action=?][method=?]", promotion_path(@promotion), "post" do

      assert_select "input#promotion_name[name=?]", "promotion[name]"

      assert_select "textarea#promotion_descr[name=?]", "promotion[descr]"

      assert_select "input#promotion_image[name=?]", "promotion[image]"

      assert_select "input#promotion_active[name=?]", "promotion[active]"
    end
  end
end
