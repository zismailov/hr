class AddRelevanceOfInvite < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :relevance, :boolean, default: true, null: false
  end
end
