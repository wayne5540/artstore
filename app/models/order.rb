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
  scope :in_process, -> { where(:status => ["paid", "shipping"]) }
  scope :closed, -> { where(:status => ["shipped", "returned"]) }


  def set_status(status)
    self.status = status
    self.save
  end

  def set_order_paid(payment)
    self.paid = true
    self.payment = payment
    self.save
  end

  def pay_by_credit_card
    set_order_paid("credit_card")
    set_status("paid")
  end

end
