class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :user_id
      t.boolean :paid, :default => false

      t.timestamps
    end
  end
end
