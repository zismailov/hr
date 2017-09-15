class Invite < ApplicationRecord
  belongs_to :assessment
  belongs_to :user
  has_one :feedback

  validates :user, :assessment, presence: true

  scope :actual, -> { where(relevance: true) }
end
