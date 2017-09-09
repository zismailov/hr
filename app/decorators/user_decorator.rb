class UserDecorator < Draper::Decorator
  delegate :id, :full_name, :email

  decorates_association :invites

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def full_name_with_role
    "#{object.full_name} (#{object.role.upcase})"
  end
end
