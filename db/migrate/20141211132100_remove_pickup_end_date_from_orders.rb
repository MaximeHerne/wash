class RemovePickupEndDateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :pickup_end_date
  end
end
