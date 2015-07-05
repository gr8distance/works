require 'rails_helper'

RSpec.describe "fees/new", type: :view do
  before(:each) do
    assign(:fee, Fee.new(
      :price => 1,
      :staff => nil,
      :user => nil
    ))
  end

  it "renders new fee form" do
    render

    assert_select "form[action=?][method=?]", fees_path, "post" do

      assert_select "input#fee_price[name=?]", "fee[price]"

      assert_select "input#fee_staff_id[name=?]", "fee[staff_id]"

      assert_select "input#fee_user_id[name=?]", "fee[user_id]"
    end
  end
end
