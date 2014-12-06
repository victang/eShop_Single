require 'rails_helper'

RSpec.describe "batches/index", :type => :view do
  before(:each) do
    assign(:batches, [
      Batch.create!(
        :code => "Code",
        :status => 1,
        :remark => "MyText",
        :active => false,
        :user_id => 2,
        :email => "Email",
        :fullname => "Fullname",
        :address1 => "Address1",
        :address2 => "Address2",
        :address3 => "Address3",
        :address4 => "Address4",
        :address5 => "Address5",
        :address6 => "Address6",
        :country => "Country",
        :city => "City",
        :phone => "Phone",
        :user_remark => "MyText"
      ),
      Batch.create!(
        :code => "Code",
        :status => 1,
        :remark => "MyText",
        :active => false,
        :user_id => 2,
        :email => "Email",
        :fullname => "Fullname",
        :address1 => "Address1",
        :address2 => "Address2",
        :address3 => "Address3",
        :address4 => "Address4",
        :address5 => "Address5",
        :address6 => "Address6",
        :country => "Country",
        :city => "City",
        :phone => "Phone",
        :user_remark => "MyText"
      )
    ])
  end

  it "renders a list of batches" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Fullname".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "Address3".to_s, :count => 2
    assert_select "tr>td", :text => "Address4".to_s, :count => 2
    assert_select "tr>td", :text => "Address5".to_s, :count => 2
    assert_select "tr>td", :text => "Address6".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
