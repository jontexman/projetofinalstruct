class RemoveFieldFromGame < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :publisher, :string
  end
end
