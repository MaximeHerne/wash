class AddWasherToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :washers, :boolean
  end
end
