class CreateSkillFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_feedbacks do |t|
      t.integer :skill_id
      t.integer :feedback_id
      t.integer :score

      t.timestamps
    end
  end
end
