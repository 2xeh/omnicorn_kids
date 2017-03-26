class Address < ApplicationRecord
  # has_many :customers
  # has_many :orders
  # has_many :payments
  has_one :province
end
