module ProductsHelper

  def render_product_name_path(product)
    link_to(product.name, product_path(product))
  end
  def render_product_desc(product)
    product.description
  end
  def render_product_image(product)
    product.image.present? ? product.image.url : 'no-image.jpeg'
  end
  def render_product_image_path(product)
    image_tag(render_product_image(product), :alt => product.name)
  end



end

