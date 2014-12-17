class RemoveOrderIdFromFormula < ActiveRecord::Migration
  def change
    remove_column :formulas, :order_id
  end
end
