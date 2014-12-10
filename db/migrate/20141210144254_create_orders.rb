class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :formula
      t.string :temperature
      t.integer :price
      t.datetime :pickup_start_date
      t.datetime :pickup_end_date
      t.datetime :delivery_start_date
      t.datetime :delivery_end_date

      t.timestamps
    end
  end
end
