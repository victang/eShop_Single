require 'rails_helper'

RSpec.describe "shopitem_tags/show", :type => :view do
  before(:each) do
    @shopitem_tag = assign(:shopitem_tag, ShopitemTag.create!(
      :shopitem_id => 1,
      :tag => "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tag/)
  end
end
