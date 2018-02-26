class Assessment < ApplicationRecord
  belongs_to :user

  has_many :invites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :user, :date, :requested_role, presence: true

  scope :active, -> { where(deleted_at: nil) }
  scope :sorted_by_date, -> { order(date: :asc) }

  def invited_users
    User.joins(:invites).where("invites.assessment_id = ?", id).order("invites.created_at ASC")
  end
end
