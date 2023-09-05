class CreateRacetracks < ActiveRecord::Migration[7.0]
  def change
    create_table :racetracks do |t|
      t.references :player_1, null: false, foreign_key: { to_table: :users }
      t.references :player_2, null: false, foreign_key: { to_table: :users }
      t.references :deck, null: false, foreign_key: true
      t.references :winner, null: true, foreign_key: { to_table: :users }
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
