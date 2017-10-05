class AssessmentPolicy < ApplicationPolicy
  def show?
    hr? || record.user == user
  end

  def create?
    hr?
  end

  def manage?
    hr?
  end
end
