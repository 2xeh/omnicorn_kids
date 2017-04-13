class Product < ApplicationRecord
  # note: for now, one product has one category.
  # however I'm considering having categories belong to other categories
  # belongs_to :category # AA - try adding this back in later
  has_many :order_items # RichOnRails
  default_scope { where(active: true) } # RichOnRails

  # for image uploading via carrierwave
  mount_uploader :image, ImageUploader

  # validations - AA - try adding back in later
  validates :name, :description, :price, :qty, presence: true

  # consideration: details not necessary and size might not be relevant
  # image shouldn't necessarily be required either (ex. gift certificate)
  # note: not writing image validation as that is handled by imageUploader

end
