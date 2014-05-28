class Product < ActiveRecord::Base
  mount_uploader :image, ProductImageUploader
  belongs_to :category
  validates :name, presence: true
end