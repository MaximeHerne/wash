class AddBracketsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :pickup_bracket, :integer
    add_column :orders, :delivery_bracket, :integer
  end
end
