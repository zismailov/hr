class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def invite_created(user, assessment)
    @assessment = assessment
    @user = user

    mail to: user.email
  end
end
