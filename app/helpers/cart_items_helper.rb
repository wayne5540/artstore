module CartItemsHelper

  def render_cart_items_product_name(item)
    item.product.name
  end

  def render_cart_items_spec_name(item)
    item.spec.name
  end

  def render_cart_items_product_price(item)
    item.product.price
  end

  def render_delete_cart_item_path(item)
    link_to("刪除", cart_item_path(item), :method => :delete)
  end

end
