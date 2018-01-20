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
    "Претендуемая должность: #{User::ROLES[object.role.to_sym]}"
  end
end
