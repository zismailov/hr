class UserPolicy < ApplicationPolicy
  def manage?
    user.role == "hr"
  end

  def show?
    user.role == "hr" || record == user
  end
end
