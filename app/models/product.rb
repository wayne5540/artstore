class Product < ActiveRecord::Base
  validates :name, presence: true
  mount_uploader :image, ProductImageUploader

end