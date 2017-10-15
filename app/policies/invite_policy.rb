class InvitePolicy < ApplicationPolicy
  def new?
    hr?
  end

  def create?
    hr?
  end
end
