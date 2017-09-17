class ChangeDefaultValueOfRoleOfUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, :string, default: "employee", null: false
  end
end
