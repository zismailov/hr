class Results
  attr_reader :assessment

  def initialize(assessment)
    @assessment = assessment
  end

  def users_comments(skill)
    comments = []
    assessment.invited_users.each do |user|
      skill_feedback = skill_feedback(skill, user)
      comments << if skill_feedback&.comment.present?
                    skill_feedback.comment
                  else
                    "Нет отзыва"
                  end
    end
    comments
  end

  def users_scores(skill)
    scores = []
    assessment.invited_users.each do |user|
      skill_feedback = skill_feedback(skill, user)
      scores << if skill_feedback&.score.present?
                  skill_feedback.score
                else
                  " "
                end
    end
    count_avg_and_sum(scores)
  end

  def count_avg_and_sum(scores)
    numbers = []
    scores.each { |score| numbers << score if score.is_a? Integer }
    scores + (numbers.empty? ? [0, 0] : [(numbers.sum * 1.0 / numbers.size).round(2), numbers.sum])
  end

  def skill_feedback(skill, user)
    feedback = assessment.feedbacks.find_by user: user
    SkillFeedback.where(skill: skill, feedback: feedback).first
  end
end
