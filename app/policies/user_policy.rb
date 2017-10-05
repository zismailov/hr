class UserPolicy < ApplicationPolicy
  def show?
    manage?
  end

  def index?
    manage?
  end

  def manage?
    hr? || record == user
  end
end
