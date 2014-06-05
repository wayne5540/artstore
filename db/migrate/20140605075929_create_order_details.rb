class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|

      t.string :billing_name
      t.string :billing_phone_number
      t.string :billing_address

      t.string :shipping_name
      t.string :shipping_phone_number
      t.string :shipping_address

      t.integer :order_id

      t.timestamps
    end
  end
end
