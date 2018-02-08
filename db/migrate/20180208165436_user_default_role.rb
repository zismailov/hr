class UserDefaultRole < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :role, "employee")
  end
end
