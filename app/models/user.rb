class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

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

  ROLES = {
    hr: "HR",
    manager: "Менеджер",
    lead_dev: "Lead Developer",
    senior_dev: "Senior Developer",
    middle_dev: "Middle Developer",
    junior_dev: "Junior Developer",
    employee: "Employee"
  }.freeze

  def self.from_omniauth(access_token)
    @data = access_token.info
    user = User.find_by email: @data["email"]

    if user
      update_user(user)
    else
      user = create_user
    end
    user
  end

  def self.update_user(user)
    user.update(full_name: @data["name"], profile_image: @data["image"])
  end

  def self.create_user
    User.create(full_name: @data["name"],
                email: @data["email"],
                password: Devise.friendly_token[0, 20],
                profile_image: @data["image"])
  end
end
