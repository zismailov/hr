class AddDepartmentIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :department, index: true, foreign_key: true
  end
end
