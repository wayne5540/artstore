class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, :default => "unpaid"
    add_column :orders, :payment, :string, :default => "unpaid"
  end
end
