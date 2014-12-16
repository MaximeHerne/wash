class RemoveWashersFromProfile < ActiveRecord::Migration
  def change
      remove_column :profiles, :washers, :boolean
  end
end