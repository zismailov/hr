class AssessmentDecorator < ApplicationDecorator
  decorates_association :user

  def date
    object.date.strftime("%e %B %Y")
  end
end
