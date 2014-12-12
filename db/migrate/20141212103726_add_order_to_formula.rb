class AddOrderToFormula < ActiveRecord::Migration
  def change
    add_reference :formulas, :order, index: true
  end
end
