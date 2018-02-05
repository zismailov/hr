class Skill < ApplicationRecord
  belongs_to :department

  validates :title, :role, :description, presence: true
  validates :title, uniqueness: { scope: %w[department_id role deleted_at], case_sensitive: false }
  validates :role, inclusion: { in: %w[lead_dev senior_dev middle_dev junior_dev manager designer] }

  scope :active, -> { where(deleted_at: nil) }

  enum role: {
    lead_dev: "Lead Developer",
    senior_dev: "Senior Developer",
    middle_dev: "Middle Developer",
    junior_dev: "Junior Developer",
    manager: "Менеджер",
    designer: "Дизайнер",
    hr: "HR"
  }
end
