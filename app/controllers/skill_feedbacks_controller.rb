class SkillFeedbacksController < ApplicationController
  expose :skill_feedback

  def create
    skill_feedback.save
    respond_with(skill_feedback)
  end

  def update
    skill_feedback.update_attributes(skill_feedback_params)
    respond_with(skill_feedback)
  end

  def destroy
    skill_feedback.destroy
    respond_with(skill_feedback)
  end

  private

  def skill_feedback_params
    params.require(:skill_feedback).permit(:skill_id, :feedback_id, :score, :comment)
  end
end
