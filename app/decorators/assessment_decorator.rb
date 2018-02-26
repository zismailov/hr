class AssessmentDecorator < ApplicationDecorator
  delegate :id, :invited_users

  decorates_association :user
  decorates_association :invites

  def date
    object.date.strftime("%e %B %Y")
  end

  def date_info
    "Оценка: #{object.date.strftime('%e %B %Y')}"
  end

  def short_date
    object.date.strftime("%e.%m.%Y")
  end

  def info
    "Претендуемая должность: #{requested_role}"
  end

  def progress
    "Оставленные отзывы: #{assessment.feedbacks.count} / #{assessment.invites.count}"
  end

  def requested_role
    User::ROLES[object.requested_role]
  end

  def user_full_name
    object.user.full_name
  end
end
