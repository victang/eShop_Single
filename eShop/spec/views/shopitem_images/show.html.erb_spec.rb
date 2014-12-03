require 'rails_helper'

RSpec.describe "shopitem_images/show", :type => :view do
  before(:each) do
    @shopitem_image = assign(:shopitem_image, ShopitemImage.create!(
      :shopitem_id => 1,
      :image => "Image",
      :descr => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
  end
end
