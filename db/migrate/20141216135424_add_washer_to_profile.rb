class AddWasherToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :washer, :boolean, default: false
  end
end
