class Assessment < ApplicationRecord
  belongs_to :user

  has_many :invites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :user, :date, presence: true

  scope :unarchived, -> { where(deleted_at: nil) }

  def unarchived?
    assessment.deleted_at.blank?
  end
end
