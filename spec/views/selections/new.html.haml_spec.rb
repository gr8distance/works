require 'rails_helper'

RSpec.describe "selections/new", type: :view do
  before(:each) do
    assign(:selection, Selection.new(
      :price => 1,
      :user => nil,
      :staff => nil,
      :split => false,
      :types => "MyString"
    ))
  end

  it "renders new selection form" do
    render

    assert_select "form[action=?][method=?]", selections_path, "post" do

      assert_select "input#selection_price[name=?]", "selection[price]"

      assert_select "input#selection_user_id[name=?]", "selection[user_id]"

      assert_select "input#selection_staff_id[name=?]", "selection[staff_id]"

      assert_select "input#selection_split[name=?]", "selection[split]"

      assert_select "input#selection_types[name=?]", "selection[types]"
    end
  end
end
