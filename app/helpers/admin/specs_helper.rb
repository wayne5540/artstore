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


  # def render_new_spec_path(product)
  #   link_to("新增規格", new_admin_product_spec_path(product), :class => "btn btn-primary")
  # end

  # def render_edit_spec_path(product, spec)
  #   link_to("編輯此規格", edit_admin_product_spec_path(product, spec))
  # end

  def render_remove_spec_form(form)
    if form.object.id
      # edit頁面時直接操作spec destroy
      link_to("移除規格", admin_product_spec_path(@product, form.object.id), :method => :delete, :confirm => "Are you sure?") 
    else
      # new頁面只操作DOM
      link_to_remove_association("移除規格", form)
    end
    
  end

end
