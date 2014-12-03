require 'rails_helper'

RSpec.describe "shopitem_images/new", :type => :view do
  before(:each) do
    assign(:shopitem_image, ShopitemImage.new(
      :shopitem_id => 1,
      :image => "MyString",
      :descr => "MyText"
    ))
  end

  it "renders new shopitem_image form" do
    render

    assert_select "form[action=?][method=?]", shopitem_images_path, "post" do

      assert_select "input#shopitem_image_shopitem_id[name=?]", "shopitem_image[shopitem_id]"

      assert_select "input#shopitem_image_image[name=?]", "shopitem_image[image]"

      assert_select "textarea#shopitem_image_descr[name=?]", "shopitem_image[descr]"
    end
  end
end
