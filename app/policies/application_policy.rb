class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.to_model
  end

  protected

  def hr?
    user.present? && user.role == "hr"
  end
end
