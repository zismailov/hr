class AssessmentDecorator < ApplicationDecorator
  delegate :id

  decorates_association :user
  decorates_association :invites

  def date
    object.date.strftime("%e %B %Y")
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
    User.roles[object.role]
  end
end
