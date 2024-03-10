class AddFSRSFieldsToCards < ActiveRecord::Migration[7.2]
  def change
    add_column :cards, :review_at, :datetime, null: false
    add_column :cards, :reviewed_at, :datetime, null: false

    add_column :cards, :elapsed_days, :integer, null: false, default: 0
    add_column :cards, :scheduled_days, :integer, null: false, default: 0

    add_column :cards, :stability, :float, null: false, default: 0
    add_column :cards, :difficulty, :float, null: false, default: 0

    add_column :cards, :stage, :string, null: false, default: :new
  end
end
