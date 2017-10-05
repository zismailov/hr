class AssessmentPolicy < ApplicationPolicy
  def manage?
    user.role == "hr"
  end

  def create?
    user.role == "hr"
  end

  def show?
    user.role == "hr" || record.user == user
  end
end
