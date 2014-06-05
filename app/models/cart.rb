# == Schema Information
#
# Table name: carts
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  cart_items_count :integer          default(0)
#

class Cart < ActiveRecord::Base
  has_many :items, :class_name => "CartItem", :dependent => :destroy
end
