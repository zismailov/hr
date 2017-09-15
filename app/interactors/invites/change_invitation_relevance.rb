module Invites
  class ChangeInvitationRelevance
    include Interactor

    delegate :invite, to: :context

    def call
      change_relevance
    end

    private

    def change_relevance
      invite.relevance = false
      invite.save || context.fail!
    end
  end
end
