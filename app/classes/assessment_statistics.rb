class AssessmentStatistics
  attr_reader :assessment

  def initialize(assessment)
    @assessment = assessment
  end

  def results
    {
      skill_statistic: skill_statistic,
      total_sum: total_sum
    }
  end

  private

  def skill_statistic
    result = []
    Skill.all.each do |skill|
      result << [skill.description, skill.id, *avg_and_sum(skill)]
    end
    result
  end

  def avg_and_sum(skill)
    sf = SkillFeedback.joins(:feedback).where("feedbacks.assessment_id = ?", assessment.id).where(skill_id: skill.id)
    [(sf.sum(:score) * 1.0 / sf.count).round(2), sf.sum(:score)]
  end

  def total_sum
    SkillFeedback.joins(:feedback).where("feedbacks.assessment_id = ?", @assessment.id).sum(:score)
  end
end
