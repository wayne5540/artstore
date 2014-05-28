class Product < ActiveRecord::Base
  has_many :specs, :dependent => :destroy
  belongs_to :category
  validates :name, presence: true
  validates :category_id, presence: true

  # carriewave
  mount_uploader :image, ProductImageUploader


end