require 'rails_helper'

RSpec.describe "fees/edit", type: :view do
  before(:each) do
    @fee = assign(:fee, Fee.create!(
      :price => 1,
      :staff => nil,
      :user => nil
    ))
  end

  it "renders the edit fee form" do
    render

    assert_select "form[action=?][method=?]", fee_path(@fee), "post" do

      assert_select "input#fee_price[name=?]", "fee[price]"

      assert_select "input#fee_staff_id[name=?]", "fee[staff_id]"

      assert_select "input#fee_user_id[name=?]", "fee[user_id]"
    end
  end
end
