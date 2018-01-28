class RenameRoleToRequestedRoleInAssessmentsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :assessments, :role, :requested_role
  end
end
