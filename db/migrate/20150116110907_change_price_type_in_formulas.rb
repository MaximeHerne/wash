class ChangePriceTypeInFormulas < ActiveRecord::Migration
  def change
    change_column :formulas, :price, :decimal, :precision => 8, :scale => 2
  end
end
