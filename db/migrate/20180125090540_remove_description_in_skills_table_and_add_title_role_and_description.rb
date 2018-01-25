class RemoveDescriptionInSkillsTableAndAddTitleRoleAndDescription < ActiveRecord::Migration[5.1]
  def change
    remove_column :skills, :description
    add_column :skills, :title, :string
    add_column :skills, :description, :text
    add_column :skills, :role, :string
  end
end
