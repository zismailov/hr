class SkillFeedbackDecorator < ApplicationDecorator
  delegate :score, :comment

  def skill_title
    object.skill.title
  end
end
