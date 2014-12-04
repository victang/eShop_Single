require 'rails_helper'

RSpec.describe "carts/index", :type => :view do
  before(:each) do
    assign(:carts, [
      Cart.create!(
        :user_id => 1,
        :batch_id => 2,
        :shopitem_id => 3,
        :shopitem_amount => 4,
        :pay_amount => 1.5,
        :selected => false
      ),
      Cart.create!(
        :user_id => 1,
        :batch_id => 2,
        :shopitem_id => 3,
        :shopitem_amount => 4,
        :pay_amount => 1.5,
        :selected => false
      )
    ])
  end

  it "renders a list of carts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
