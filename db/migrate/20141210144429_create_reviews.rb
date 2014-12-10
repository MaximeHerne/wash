class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :order, index: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
