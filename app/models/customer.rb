class Customer < ApplicationRecord
  # note: a customer can have many addresses like home or work
  belongs_to :address
  has_many :orders
end
