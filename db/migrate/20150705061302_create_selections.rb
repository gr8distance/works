class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :price,null: false
      t.references :user, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
      t.boolean :split
      t.string :types

      t.timestamps null: false
    end
  end
end
