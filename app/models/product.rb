class Product < ApplicationRecord
  # has_many :order_items

  # note: for now, one product has one category.
  # however I'm considering having categories belong to other categories
  belongs_to :category

  # for image uploading via carrierwave
  mount_uploader :image, ImageUploader
end
