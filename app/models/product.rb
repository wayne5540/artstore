# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#  price       :integer          default(0)
#  sellable    :boolean          default(FALSE)
#

class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :specs, :dependent => :destroy
  belongs_to :category
  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  accepts_nested_attributes_for :specs

  # carriewave
  mount_uploader :image, ProductImageUploader


  scope :sellable, -> { where( :sellable => true ) }

  # overide friendly method to show chinese
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  # set slug name when slug is not unique
  def slug_candidates
    [
      [:name, :price]
    ]
  end

end
