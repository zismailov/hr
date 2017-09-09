class InviteDecorator < Draper::Decorator
  delegate_all
  decorates_association :assessment
end
