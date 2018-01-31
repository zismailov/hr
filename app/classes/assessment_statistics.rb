class AssessmentStatistics
  attr_reader :assessment, :skills

  def initialize(assessment)
    @assessment = assessment
    @skills = assessment.user.department.skills.where(role: User.roles[assessment.requested_role])
  end

  def results
    {
      skill_statistic: skill_statistic,
      total_avg_sum: assessment.feedbacks.empty? ? 0 : total_avg_sum
    }
  end

  private

  def skill_statistic
    result = []
    skills.each do |skill|
      result << [skill.title, skill.id, *avg_and_sum(skill)]
    end
    result
  end

  def avg_and_sum(skill)
    sf = SkillFeedback.joins(:feedback).where("feedbacks.assessment_id = ?", assessment.id).where(skill_id: skill.id)
    return [0, 0] if sf.empty?

    [(sf.sum(:score) * 1.0 / sf.count).round(2), sf.sum(:score)]
  end

  def total_avg_sum
    sum = 0
    skills.each do |skill|
      sf = SkillFeedback.joins(:feedback).where("feedbacks.assessment_id = ?", assessment.id).where(skill_id: skill.id)
      sum += (sf.sum(:score) * 1.0 / sf.count).round(2)
    end
    sum
  end
end
