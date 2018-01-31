class FeedbackPolicy < ApplicationPolicy
  def manage?
    record.user == user
  end
end
