class AddReviewAtToCards < ActiveRecord::Migration[7.2]
  def change
    add_column :cards, :review_at, :datetime
  end
end
