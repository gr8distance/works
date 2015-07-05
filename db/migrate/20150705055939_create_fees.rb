class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.integer :price
      t.references :staff, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
