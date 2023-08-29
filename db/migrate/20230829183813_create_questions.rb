class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
