module Invites
  class Create
    include Interactor

    delegate :invite, to: :context

    def call
      invite.save || context.fail!

      send_email(invite.user)
    end

    private

    def send_email(user)
      ApplicationMailer.invite_created(user, invite.assessment).deliver_later
    end
  end
end
