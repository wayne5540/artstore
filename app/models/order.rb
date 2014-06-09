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

  scope :recent, -> { order("id DESC") }
  scope :unpaid, -> { where(:paid => false) }
  scope :paid, -> { where(:status => "paid") }
  scope :shipping, -> { where(:status => "shipping") }
  scope :shipped, -> { where(:status => "shipped") }
  scope :returned, -> { where(:status => "returned") }


  def set_status(status)
    self.status = status
    self.save
  end

  def set_order_paid(payment)
    self.paid = true
    self.payment = payment
    self.save
  end

  # def next_step
  #   case self.status
  #   when "unpaid"
  #     set_status("paid")
  #     set_order_paid("by_admin")
  #   when "paid"
  #     set_status("shipping")
  #     #OrderMailer.shipping_notification(self, self.user.email).deliver
  #   when "shipping"
  #     set_status("shipped")
  #   when "shipped"
  #     set_status("returned")
  #   when "returned"
  #     #TODO can't change to other status, should show some message
  #     false
  #   else
  #     false
  #   end
  # end

  def pay_by_credit_card
    set_order_paid("credit_card")
    set_status("paid")
  end

end
