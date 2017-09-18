class UserPolicy < ApplicationPolicy
  def manage?
    user.role == "hr"
  end
end
