require 'rails_helper'

RSpec.describe "shopitems/index", :type => :view do
  before(:each) do
    assign(:shopitems, [
      Shopitem.create!(
        :code_name => "Code Name",
        :short_name => "Short Name",
        :long_name => "Long Name",
        :stock => 1,
        :price => 1.5,
        :sales => 2,
        :image => "Image",
        :descr => "MyText"
      ),
      Shopitem.create!(
        :code_name => "Code Name",
        :short_name => "Short Name",
        :long_name => "Long Name",
        :stock => 1,
        :price => 1.5,
        :sales => 2,
        :image => "Image",
        :descr => "MyText"
      )
    ])
  end

  it "renders a list of shopitems" do
    render
    assert_select "tr>td", :text => "Code Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Long Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
