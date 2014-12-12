class RemoveFormulaFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :formula
  end
end
