class Feedback < ApplicationRecord
  has_many :skill_feedbacks, dependent: :destroy

  belongs_to :assessment
  belongs_to :user

  accepts_nested_attributes_for :skill_feedbacks
end
