class AddRoleToAssessments < ActiveRecord::Migration[5.1]
  def change
    add_column :assessments, :role, :string
  end
end
