class FeedbacksController < ApplicationController
  respond_to :html

  expose :assessment

  expose :feedback
  expose :feedbacks, -> { current_user.feedbacks }

  def index; end

  def new
    Skill.all.each do |skill|
      feedback.skill_feedbacks << SkillFeedback.new(skill_id: skill.id)
    end
  end

  def create
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
    params.require(:feedback).permit(:user_id,
      :assessment_id,
      "skill_feedbacks_attributes": %i[score skill_id comment])
  end
end
