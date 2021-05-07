class AddFieldToGame < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :publisher, null: false, foreign_key: true
  end
end
