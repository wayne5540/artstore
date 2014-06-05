# == Schema Information
#
# Table name: specs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  detail     :text
#  inventory  :integer          default(0)
#  product_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Spec < ActiveRecord::Base
  belongs_to :product
  validates :name, presence: true
end
