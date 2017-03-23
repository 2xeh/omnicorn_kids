class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone_number
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
