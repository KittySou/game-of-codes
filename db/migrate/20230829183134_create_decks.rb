class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :tips
      t.integer :level, null: false, default: 1

      t.timestamps
    end
  end
end
