require 'rails_helper'

RSpec.describe "fees/index", type: :view do
  before(:each) do
    assign(:fees, [
      Fee.create!(
        :price => 1,
        :staff => nil,
        :user => nil
      ),
      Fee.create!(
        :price => 1,
        :staff => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of fees" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
