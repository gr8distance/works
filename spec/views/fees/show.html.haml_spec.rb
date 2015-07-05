require 'rails_helper'

RSpec.describe "fees/show", type: :view do
  before(:each) do
    @fee = assign(:fee, Fee.create!(
      :price => 1,
      :staff => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
