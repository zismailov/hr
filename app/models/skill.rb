class Skill < ApplicationRecord
  belongs_to :department

  validates :description, presence: true
end
