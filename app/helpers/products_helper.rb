module ProductsHelper

  def render_product_name(product)
    link_to(product.name, product_path(product))
  end
  def render_product_desc(product)
    simple_format(product.description)
  end

  def render_product_image(product)
    image_tag((product.image.url||'no-image.jpeg'), :alt => product.name)
  end
  def render_product_price(product)
    product.price
  end



end

