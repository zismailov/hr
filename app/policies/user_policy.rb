class UserPolicy < ApplicationPolicy
  def manage?
    user.role == "hr"
  end

  def show?
    user.role == "hr" || record == user
  end

  def index?
    user.role == "hr" || record == user
  end
end
