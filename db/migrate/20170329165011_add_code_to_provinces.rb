class AddCodeToProvinces < ActiveRecord::Migration[5.0]
  def change
    add_column :provinces, :code, :string
  end
end
