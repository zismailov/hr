class AssessmentPolicy < ApplicationPolicy
  def create?
    user.role == "hr"
  end
end
