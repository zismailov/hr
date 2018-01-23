class AddDepartmentIdToSkill < ActiveRecord::Migration[5.1]
  def change
    add_reference :skills, :department, index: true, foreign_key: true
  end
end
