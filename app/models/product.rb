class Product < ApplicationRecord
  # has_many :order_items

  # note: for now, one product has one category.
  # however I'm considering having categories belong to other categories
  belongs_to :category
  has_many :order_items
  default_scope { where(active: true) }

  # for image uploading via carrierwave
  mount_uploader :image, ImageUploader

  # validations
  validates :name, :description, :price, :qty, presence: true
  # consideration: details not necessary and size might not be relevant
  # image shouldn't necessarily be required either (ex. gift certificate)
  # note: not writing image validation as that is handled by imageUploader
end
