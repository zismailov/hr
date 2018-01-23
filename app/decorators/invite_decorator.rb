class InviteDecorator < ApplicationDecorator
  delegate_all

  decorates_association :user
  decorates_association :assessment
  decorates_association :feedback

  def status
    invite.feedback.present? ? "Заполнил(а) отзыв" : "В процессе"
  end
end
