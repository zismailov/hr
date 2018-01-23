class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :full_name, :role, :level, presence: true

  scope :sorted, -> { order(full_name: :asc) }

  scope :employees, -> { where(role: "employee") }
  scope :hrs, -> { where(role: "hr") }
  scope :managers, -> { where(role: "manager") }
  scope :leads, -> { where(role: "lead_dev") }
  scope :seniors, -> { where(role: "senior_dev") }
  scope :middles, -> { where(role: "middle_dev") }
  scope :juniors, -> { where(role: "junior_dev") }

  has_many :assessments, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  belongs_to :department

  ROLES = {
    hr: "HR",
    manager: "Менеджер",
    lead_dev: "Lead Developer",
    senior_dev: "Senior Developer",
    middle_dev: "Middle Developer",
    junior_dev: "Junior Developer",
    employee: "Сотрудник"
  }.freeze

  def self.from_omniauth(access_token)
    @data = access_token.info
    user = User.find_by email: @data["email"]

    user ? update_user(user) : user = create_user
    user
  end

  def self.update_user(user)
    user.update(full_name: @data["name"], profile_image: @data["image"])
  end

  def self.create_user
    User.create(full_name: @data["name"],
                email: @data["email"],
                password: Devise.friendly_token[0, 20],
                confirmed_at: Time.zone.now,
                profile_image: @data["image"])
  end
end
