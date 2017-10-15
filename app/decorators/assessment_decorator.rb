class AssessmentDecorator < ApplicationDecorator
  delegate :id

  decorates_association :user
  decorates_association :invites

  def date
    object.date.strftime("%e %B %Y")
  end
end
