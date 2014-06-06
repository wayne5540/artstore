# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  total      :integer
#  user_id    :integer
#  paid       :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_one :order_detail, :dependent => :destroy
  has_many :items, :class_name => "OrderItem", :dependent => :destroy

  accepts_nested_attributes_for :order_detail
end
