class InvitePolicy < ApplicationPolicy
  def new?
    hr?
  end

  def create?
    hr?
  end

  def destroy?
    hr?
  end
end
