class Payment < ApplicationRecord
  has_one :address
  belongs_to :order
end
