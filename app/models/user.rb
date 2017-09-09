class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  scope :sorted, -> { order(full_name: :asc) }

  scope :hr, -> { where(role: "hr") }
  scope :manager, -> { where(role: "manager") }
  scope :lead, -> { where(role: "lead_dev") }
  scope :senior, -> { where(role: "senior_dev") }
  scope :middle, -> { where(role: "middle_dev") }
  scope :junior, -> { where(role: "junior_dev") }

  has_many :assessments, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  def full_name_with_role
    "#{full_name} (#{role.upcase})"
  end
end
