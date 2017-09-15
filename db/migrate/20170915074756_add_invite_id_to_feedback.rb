class AddInviteIdToFeedback < ActiveRecord::Migration[5.1]
  def change
    add_reference :feedbacks, :invite, index: true, foreign_key: true
  end
end
