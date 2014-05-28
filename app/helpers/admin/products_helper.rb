module Admin::ProductsHelper

  def render_edit_admin_product_path(product)
    link_to("edit", edit_admin_product_path(product), :class => "btn btn-default") 
  end

  def render_destroy_admin_product_path(product)
    link_to("delete", admin_product_path(product), :class => "btn btn-default", :method => :delete, :confirm => "Are you sure?")
  end

end
