class ApplicationPolicy
  delegate :hr?, to: :user

  attr_reader :user, :record

  def initialize(user, record = nil)
    @user = user
    @record = record.to_model if record
  end
end
