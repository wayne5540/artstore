module Admin::ProductsHelper

  def render_admin_product_path(product)
    link_to("商品管理", admin_product_path(product), :class => "btn btn-success") 
  end

  def render_edit_admin_product_path(product)
    link_to("edit", edit_admin_product_path(product), :class => "btn btn-default") 
  end

  def render_destroy_admin_product_path(product)
    link_to("delete", admin_product_path(product), :class => "btn btn-default", :method => :delete, :confirm => "Are you sure?")
  end

  def render_sellable_status(product)
    if product.sellable
      message = "此商品已上架"
      class_type = "label label-success"
    else
      message = "此商品未上架"
      class_type = "label label-default"
    end
    content_tag(:span, message, class: class_type)
  end

end
