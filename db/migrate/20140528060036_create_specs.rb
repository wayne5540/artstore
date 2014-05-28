class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :name
      t.text :detail
      t.integer :inventory, :default => 0
      t.integer :product_id

      t.timestamps
    end
  end
end
