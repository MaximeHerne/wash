class AddFormulaIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :formula, index: true
  end
end
