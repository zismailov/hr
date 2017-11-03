class Invite < ApplicationRecord
  belongs_to :assessment
  belongs_to :user
  has_one :feedback, dependent: :destroy

  validates :user, :assessment, presence: true
end
