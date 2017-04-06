class Address < ApplicationRecord
  # has_many :customers
  # has_many :orders
  # has_many :payments
  belongs_to :province

  # Validations
  validates :street_address, :city, :postal_code, presence: true

  # validate postal code format
  pcd_fmt = /\w\d\w\s?\d\w\d/
  validates :postal_code, format: { with: pcd_fmt }

  # getter method for active admin support
  def name
    street_address
  end
end
