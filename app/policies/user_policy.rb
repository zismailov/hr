class UserPolicy < ApplicationPolicy
  def show?
    hr? || record == user
  end

  def index?
    hr? || record == user
  end

  def update?
    hr?
  end

  def edit?
    hr?
  end
end
