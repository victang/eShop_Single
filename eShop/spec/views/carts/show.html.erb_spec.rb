require 'rails_helper'

RSpec.describe "carts/show", :type => :view do
  before(:each) do
    @cart = assign(:cart, Cart.create!(
      :user_id => 1,
      :batch_id => 2,
      :shopitem_id => 3,
      :shopitem_amount => 4,
      :pay_amount => 1.5,
      :selected => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
  end
end
