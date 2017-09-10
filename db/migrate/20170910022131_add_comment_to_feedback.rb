class AddCommentToFeedback < ActiveRecord::Migration[5.1]
  def change
    add_column :skill_feedbacks, :comment, :text
  end
end
