class RemovePickupStartDateAndDeliveryStartDateFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :pickup_start_date
    remove_column :orders, :delivery_start_date
  end
end
