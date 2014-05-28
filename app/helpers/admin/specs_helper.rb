module Admin::SpecsHelper


  def render_spec_name(spec)
    spec.name
  end

  def render_spec_detail(spec)
    simple_format(spec.detail)
  end

  def render_spec_inventory(spec)
    spec.inventory
  end


  def render_new_spec_path(product)
    link_to("新增規格", new_admin_product_spec_path(product), :class => "btn btn-primary")
  end

  def render_edit_spec_path(product, spec)
    link_to("編輯規格", edit_admin_product_spec_path(product, spec))
  end

end
