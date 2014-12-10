class AddReviewIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :review_id, :integer
  end
end
