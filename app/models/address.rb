class Address < ApplicationRecord
  has_many :customers, :orders, :payments
  belongs_to :province
end
