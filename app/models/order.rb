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


  def set_status(status)
    self.status = status
    self.save
  end

  def paid
    self.paid = true
    self.save
  end

  def next_step
    case self.status
    when "unpaid"
      set_status("paid")
      paid
    when "paid"
      set_status("shipping")
    when "shipping"
      set_status("shipped")
    when "shipped"
      set_status("returned")
    when "returned"
      #TODO can't change to other status, show some message here
      false
    else
      false
    end
  end

end
