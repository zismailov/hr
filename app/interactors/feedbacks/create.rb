module Feedbacks
  class Create
    include Interactor

    delegate :feedback, :user, :assessment, :invite, to: :context

    def call
      context.feedback = feedback

      feedback.user = user
      feedback.assessment = assessment
      feedback.invite = invite
      feedback.save || context.fail!
    end
  end
end
