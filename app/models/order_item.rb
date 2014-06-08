# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  spec_id    :integer
#  price      :integer
#  created_at :datetime
#  updated_at :datetime
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :spec
end
