class AssessmentStatistics
  attr_reader :assessment, :skills

  def initialize(assessment)
    @assessment = assessment
    @skills = Skill.where(role: Skill.roles[assessment.requested_role], department: [assessment.user.department, nil])
  end

  def results
    {
      skill_statistic: skill_statistic,
      total_avg_sum: assessment.feedbacks.any? ? total_avg_sum : 0
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
    sf = SkillFeedback.joins(:feedback).where("feedbacks.assessment_id = ?", assessment.id)
                      .where(skill: skill).where.not(score: nil)
    return [0, 0] if sf.empty?

    [(sf.sum(:score) * 1.0 / sf.count).round(2), sf.sum(:score)]
  end

  def total_avg_sum
    sum = 0
    skills.each do |skill|
      sf = SkillFeedback.joins(:feedback).where("feedbacks.assessment_id = ?", assessment.id)
                        .where(skill: skill).where.not(score: nil)
      sum += (sf.sum(:score) * 1.0 / sf.count).round(2)
    end
    sum
  end
end
