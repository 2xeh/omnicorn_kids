class Customer < ApplicationRecord
  # note: for now, one customer has one address.
  # However, this doesn't mean that two customers can't have the same address
  # if the billing address is different, that is handled in the payment table
  belongs_to :address
  has_many :orders
  validates :first_name, :last_name, :password, :email, presence: true
  # validates :first_name, :last_name, :password, length: { min: 2 }
  validates :email, uniqueness: true
  # for now, considering that phone number could be 23409872 if
  # the user neglects hyphens
  validates :phone_number, length: { minimum: 7 }
  email_pattern = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: email_pattern }

  # getter method for active admin support
  def name
    "#{first_name} #{last_name}"
  end
end
