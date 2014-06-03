class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :quantity, default: 0
      t.integer :product_id
      t.integer :spec_id
      t.timestamps
    end
  end
end
