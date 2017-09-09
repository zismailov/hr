class AddLevelToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :level, :integer, default: 1, null: false
  end
end
