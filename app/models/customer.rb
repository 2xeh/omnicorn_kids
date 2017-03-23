class Customer < ApplicationRecord
  # note: a customer can have many addresses like home or work
  has_many :addresses, :orders
end
