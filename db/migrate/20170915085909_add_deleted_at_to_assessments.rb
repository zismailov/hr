class AddDeletedAtToAssessments < ActiveRecord::Migration[5.1]
  def change
    add_column :assessments, :deleted_at, :datetime
  end
end
