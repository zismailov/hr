class FeedbacksController < ApplicationController
  respond_to :html

  expose :assessment

  expose :feedback
  expose :feedbacks, -> { current_user.feedbacks.includes(assessment: :user) }
  expose :skill_feedbacks, -> { fetch_skill_feedbacks }

  def index; end

  def new
    Skill.all.each do |skill|
      feedback.skill_feedbacks << SkillFeedback.new(skill_id: skill.id)
    end
  end

  def create
    feedback.user = current_user
    feedback.assessment = assessment
    feedback.invite = assessment.invites.find_by(user: current_user)

    feedback.save

    respond_with feedback
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

  def fetch_skill_feedbacks
    feedback.skill_feedbacks.includes(:skill)
  end
end
