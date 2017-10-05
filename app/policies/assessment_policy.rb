class AssessmentPolicy < ApplicationPolicy
  def manage?
    user.role == "hr"
  end
end
