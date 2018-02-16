class Department < ApplicationRecord
  has_many :users
  has_many :skills

  validates :title, presence: true, uniqueness: true
end
