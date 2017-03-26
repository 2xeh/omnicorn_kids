class AddProvinceRefToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :province, foreign_key: true
  end
end
