class AssessmentPolicy < ApplicationPolicy
  def show?
    hr? || record.user == user
  end

  def new?
    hr?
  end

  def create?
    hr?
  end

  def edit?
    hr?
  end

  def update?
    hr?
  end

  def manage?
    hr?
  end
end
