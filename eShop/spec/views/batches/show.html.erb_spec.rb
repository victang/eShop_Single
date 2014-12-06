require 'rails_helper'

RSpec.describe "batches/show", :type => :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Fullname/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/Address3/)
    expect(rendered).to match(/Address4/)
    expect(rendered).to match(/Address5/)
    expect(rendered).to match(/Address6/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
  end
end
