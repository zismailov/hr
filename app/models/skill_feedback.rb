class SkillFeedback < ApplicationRecord
  belongs_to :feedback
  belongs_to :skill

  validates :score, :comment, presence: true
end
