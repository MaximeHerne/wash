class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :washer_id, :integer
    add_column :orders, :finished_at, :datetime
  end
end
