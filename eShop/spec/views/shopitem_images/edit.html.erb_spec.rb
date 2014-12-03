require 'rails_helper'

RSpec.describe "shopitem_images/edit", :type => :view do
  before(:each) do
    @shopitem_image = assign(:shopitem_image, ShopitemImage.create!(
      :shopitem_id => 1,
      :image => "MyString",
      :descr => "MyText"
    ))
  end

  it "renders the edit shopitem_image form" do
    render

    assert_select "form[action=?][method=?]", shopitem_image_path(@shopitem_image), "post" do

      assert_select "input#shopitem_image_shopitem_id[name=?]", "shopitem_image[shopitem_id]"

      assert_select "input#shopitem_image_image[name=?]", "shopitem_image[image]"

      assert_select "textarea#shopitem_image_descr[name=?]", "shopitem_image[descr]"
    end
  end
end
