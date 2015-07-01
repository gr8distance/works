class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name,null: false
      t.string :staff_code, null: false
			t.references :user

      t.timestamps null: false
    end
  end
end
