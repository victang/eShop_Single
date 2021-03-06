require 'rails_helper'

RSpec.describe "carts/new", :type => :view do
  before(:each) do
    assign(:cart, Cart.new(
      :user_id => 1,
      :batch_id => 1,
      :shopitem_id => 1,
      :shopitem_amount => 1,
      :pay_amount => 1.5,
      :selected => false
    ))
  end

  it "renders new cart form" do
    render

    assert_select "form[action=?][method=?]", carts_path, "post" do

      assert_select "input#cart_user_id[name=?]", "cart[user_id]"

      assert_select "input#cart_batch_id[name=?]", "cart[batch_id]"

      assert_select "input#cart_shopitem_id[name=?]", "cart[shopitem_id]"

      assert_select "input#cart_shopitem_amount[name=?]", "cart[shopitem_amount]"

      assert_select "input#cart_pay_amount[name=?]", "cart[pay_amount]"

      assert_select "input#cart_selected[name=?]", "cart[selected]"
    end
  end
end
