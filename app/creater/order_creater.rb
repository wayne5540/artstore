class OrderCreater
  attr_reader :order, :items, :user

  def initialize(order, cart_items)
    @order = order
    @items = cart_items
  end

  def process
    update_order && update_items
  end

  def update_order
    @order.update(
      total: @items.inject(0){|sum, item| sum + item.product.price }
      )
  end

  def update_items
    true
  end


end