class Customer < ApplicationRecord
  # note: for now, one customer has one address. However, this doesn't mean that two customers can't have the same address
  # if the billing address is different, that is handled in the payment table
  belongs_to :address
  has_many :orders
end
