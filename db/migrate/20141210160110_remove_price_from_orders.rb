class RemovePriceFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :price, :integer
  end
end
