module Invites
  class ChangeInvitationRelevance
    include Interactor

    delegate :feedback, to: :context
    delegate :invite, to: :feedback

    def call
      check_feedback
    end

    private

    def check_feedback
      feedback.valid? ? change_relevance : context.fail!(message: "Все поля должны быть заполнены")
    end

    def change_relevance
      invite.relevance = false
      invite.save || context.fail!(message: "Статус не может быть изменен")
    end
  end
end
