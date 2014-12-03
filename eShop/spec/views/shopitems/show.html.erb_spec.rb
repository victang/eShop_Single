require 'rails_helper'

RSpec.describe "shopitems/show", :type => :view do
  before(:each) do
    @shopitem = assign(:shopitem, Shopitem.create!(
      :code_name => "Code Name",
      :short_name => "Short Name",
      :long_name => "Long Name",
      :stock => 1,
      :price => 1.5,
      :sales => 2,
      :image => "Image",
      :descr => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code Name/)
    expect(rendered).to match(/Short Name/)
    expect(rendered).to match(/Long Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
  end
end
