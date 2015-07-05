require 'rails_helper'

RSpec.describe "selections/show", type: :view do
  before(:each) do
    @selection = assign(:selection, Selection.create!(
      :price => 1,
      :user => nil,
      :staff => nil,
      :split => false,
      :types => "Types"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Types/)
  end
end
