require 'rails_helper'

RSpec.describe "promotion_tags/show", :type => :view do
  before(:each) do
    @promotion_tag = assign(:promotion_tag, PromotionTag.create!(
      :promotion_id => 1,
      :tag => "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tag/)
  end
end
