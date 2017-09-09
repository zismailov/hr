class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :assessment_id

      t.timestamps
    end
  end
end
