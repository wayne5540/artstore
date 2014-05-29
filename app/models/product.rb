class Product < ActiveRecord::Base
  has_many :specs, :dependent => :destroy
  belongs_to :category
  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  accepts_nested_attributes_for :specs

  # carriewave
  mount_uploader :image, ProductImageUploader


  scope :sellable, where( :sellable => true )

end