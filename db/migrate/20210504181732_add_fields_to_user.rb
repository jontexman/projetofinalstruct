class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_Admin, :boolean
  end
end
