class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :user, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
			t.string :staff_code,null: false

      t.datetime :start_work,default: Time.now,null: false
      t.datetime :end_word
      t.string :image,null: false

      t.timestamps null: false
    end
  end
end
