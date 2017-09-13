class Assessment < ApplicationRecord
  belongs_to :user

  has_many :invites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :user, :date, presence: true
end
