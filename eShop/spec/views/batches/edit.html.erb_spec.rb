require 'rails_helper'

RSpec.describe "batches/edit", :type => :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!(
      :code => "MyString",
      :status => 1,
      :remark => "MyText",
      :active => false,
      :user_id => 1,
      :email => "MyString",
      :fullname => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :address3 => "MyString",
      :address4 => "MyString",
      :address5 => "MyString",
      :address6 => "MyString",
      :country => "MyString",
      :city => "MyString",
      :phone => "MyString",
      :user_remark => "MyText"
    ))
  end

  it "renders the edit batch form" do
    render

    assert_select "form[action=?][method=?]", batch_path(@batch), "post" do

      assert_select "input#batch_code[name=?]", "batch[code]"

      assert_select "input#batch_status[name=?]", "batch[status]"

      assert_select "textarea#batch_remark[name=?]", "batch[remark]"

      assert_select "input#batch_active[name=?]", "batch[active]"

      assert_select "input#batch_user_id[name=?]", "batch[user_id]"

      assert_select "input#batch_email[name=?]", "batch[email]"

      assert_select "input#batch_fullname[name=?]", "batch[fullname]"

      assert_select "input#batch_address1[name=?]", "batch[address1]"

      assert_select "input#batch_address2[name=?]", "batch[address2]"

      assert_select "input#batch_address3[name=?]", "batch[address3]"

      assert_select "input#batch_address4[name=?]", "batch[address4]"

      assert_select "input#batch_address5[name=?]", "batch[address5]"

      assert_select "input#batch_address6[name=?]", "batch[address6]"

      assert_select "input#batch_country[name=?]", "batch[country]"

      assert_select "input#batch_city[name=?]", "batch[city]"

      assert_select "input#batch_phone[name=?]", "batch[phone]"

      assert_select "textarea#batch_user_remark[name=?]", "batch[user_remark]"
    end
  end
end
