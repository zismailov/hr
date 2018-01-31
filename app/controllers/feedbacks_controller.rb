class FeedbacksController < ApplicationController
  respond_to :html

  expose :assessment

  expose :feedback
  expose :feedbacks, -> { current_user.feedbacks.includes(assessment: :user) }
  expose :skill_feedbacks, -> { feedback.skill_feedbacks.includes(:skill) }
  expose :skills, -> { fetch_skills }

  def index; end

  def new
    skills.each do |skill|
      feedback.skill_feedbacks << SkillFeedback.new(skill: skill)
    end
  end

  def create
    result = Feedbacks::Create.call(feedback: feedback,
                                    user: current_user,
                                    assessment: assessment,
                                    invite: assessment.invites.find_by(user: current_user))
    respond_with result.feedback
  end

  def update
    feedback.update_attributes(feedback_params)
    respond_with(feedback)
  end

  def destroy
    feedback.destroy
    respond_with(feedback)
  end

  private

  def feedback_params
    params.require(:feedback).permit("skill_feedbacks_attributes": %i[id score skill_id comment])
  end

  def fetch_skills
    assessment.user.department.skills.where(role: User.roles[assessment.requested_role])
  end
end
