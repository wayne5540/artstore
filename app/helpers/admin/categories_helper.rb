module Admin::CategoriesHelper

  def render_edit_admin_category_path(category)
    link_to("編輯", edit_admin_category_path(category), :class => "btn btn-default") 
  end

  def render_destroy_admin_category_path(category)
    link_to("刪除", admin_category_path(category), :class => "btn btn-default", :method => :delete, :confirm => "你確定？刪除分類後將會連該分類的商品一起刪除喔！")
  end
end
