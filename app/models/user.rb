class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  ROLES = {
    "hr" => "HR",
    "manager" => "Менеджер",
    "lead_dev" => "Lead Developer",
    "senior_dev" => "Senior Developer",
    "middle_dev" => "Middle Developer",
    "junior_dev" => "Junior Developer",
    "designer" => "Дизайнер",
    "employee" => "Сотрудник"
  }.freeze

  belongs_to :department

  has_many :assessments, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :full_name, :role, :level, presence: true
  validates :role, inclusion: { in: User::ROLES.keys.map(&:to_s) }
  validates :level, inclusion: 1..5

  scope :sorted, -> { order(full_name: :asc) }
  scope :hr, -> { where(role: "hr") }

  def hr?
    role == "hr"
  end

  def employee?
    !hr?
  end

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
                role: "employee",
                profile_image: @data["image"])
  end
end
