class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :details
      t.decimal :price
      t.string :size
      t.integer :qty

      t.timestamps
    end
  end
end
