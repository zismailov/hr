class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :assessment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
