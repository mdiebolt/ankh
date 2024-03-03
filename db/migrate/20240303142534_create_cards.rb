class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :decks do |t|
      t.string :name

      t.timestamps
    end

    create_table :cards do |t|
      t.references :deck

      t.timestamps
    end
  end
end
