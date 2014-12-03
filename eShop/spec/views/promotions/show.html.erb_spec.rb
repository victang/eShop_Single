require 'rails_helper'

RSpec.describe "promotions/show", :type => :view do
  before(:each) do
    @promotion = assign(:promotion, Promotion.create!(
      :name => "Name",
      :descr => "MyText",
      :image => "Image",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/false/)
  end
end
