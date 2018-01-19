class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record = nil)
    @user = user
    @record = record.to_model if record
  end

  def hr?
    user.role == "hr"
  end
end
