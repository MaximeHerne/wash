class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :locality
      t.string :postal_code
      t.references :user, index: true

      t.timestamps
    end
  end
end
