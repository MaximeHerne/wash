class RemoveDeliveryEndDateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :delivery_end_date
  end
end
