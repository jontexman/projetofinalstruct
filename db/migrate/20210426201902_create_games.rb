class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :price
      t.integer :category
      t.string :publisher
      t.string :description
      t.string :picture
      t.string :trailer


      t.timestamps
    end
  end
end
