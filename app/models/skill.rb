class Skill < ApplicationRecord
  belongs_to :department

  validates :title, :role, :description, presence: true
  validates :title, uniqueness: { scope: %w[department_id role deleted_at], case_sensitive: false }
  validates :role, inclusion: { in: %w[hr manager lead_dev senior_dev middle_dev junior_dev designer] }

  scope :active, -> { where(deleted_at: nil) }
end
