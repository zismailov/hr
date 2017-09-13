class Invite < ApplicationRecord
  belongs_to :assessment
  belongs_to :user

  validates :user, :assessment, presence: true
end
