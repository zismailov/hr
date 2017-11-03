class DeleteRelevanceFromInvites < ActiveRecord::Migration[5.1]
  def change
    remove_column :invites, :relevance
  end
end
