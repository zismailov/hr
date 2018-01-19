class InviteDecorator < ApplicationDecorator
  delegate_all

  decorates_association :user
  decorates_association :assessment
end
