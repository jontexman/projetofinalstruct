class CreateGamecategories < ActiveRecord::Migration[6.1]
  def change
    create_table :gamecategories do |t|
      t.references :game, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
