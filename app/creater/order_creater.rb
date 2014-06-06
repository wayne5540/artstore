class OrderCreater
  attr_reader :order, :items

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

  # def update_items
  #   OrderItemsCreater.new(@order, @items)
  # end

  def update_items
    @items.each do |item| 
      @order.items.create(
        product_id: item.product_id,
        spec_id:    item.spec_id,
        price:      item.product.price
      )
    end
    true
  end


end