class Province < ApplicationRecord
  # has_many :addresses
  validates :name, :pst, :gst, :hst, :code, presence: true
  validates :gst, :pst, :hst, numericality: true
  # validates :code, length: { is: 2 }

  # shortest province/territory name is Yukon. Not sure if this is the best
  validates :name, length: { minimum: 5 }
end
