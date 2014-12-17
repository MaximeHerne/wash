class AddPickupStartDateAndDeliveryStartDateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :pickup_start_date, :date
    add_column :orders, :delivery_start_date, :date
  end
end
