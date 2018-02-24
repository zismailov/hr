class AssessmentPolicy < ApplicationPolicy
  def show?
    hr? || record.user == user
  end

  def show_results?
    hr?
  end

  def create?
    hr?
  end

  def new?
    hr?
  end

  def edit?
    hr?
  end

  def update?
    hr?
  end

  def destroy?
    hr?
  end

  def manage?
    hr?
  end
end
