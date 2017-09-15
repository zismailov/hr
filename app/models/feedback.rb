class Feedback < ApplicationRecord
  has_many :skill_feedbacks, dependent: :destroy

  belongs_to :assessment
  belongs_to :invite
  belongs_to :user

  validates :user, :assessment, presence: true
  validates :user_id, uniqueness: { scope: :invite_id }

  accepts_nested_attributes_for :skill_feedbacks
end
