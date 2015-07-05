require 'rails_helper'

RSpec.describe "selections/index", type: :view do
  before(:each) do
    assign(:selections, [
      Selection.create!(
        :price => 1,
        :user => nil,
        :staff => nil,
        :split => false,
        :types => "Types"
      ),
      Selection.create!(
        :price => 1,
        :user => nil,
        :staff => nil,
        :split => false,
        :types => "Types"
      )
    ])
  end

  it "renders a list of selections" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Types".to_s, :count => 2
  end
end
