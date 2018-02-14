class AssessmentStatistics
  attr_reader :assessment, :skills

  def initialize(assessment)
    @assessment = assessment
    @skills = Skill.active.where(role: assessment.requested_role, department: [assessment.user.department, nil])
  end

  def results
    {
      skill_statistic: skill_statistic,
      total_result: total_result
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
    sf = fetch_skill_feedbacks(skill)
    return [0, 0] if sf.empty?

    [(sf.sum(:score) * 1.0 / sf.count).round(2), sf.sum(:score)]
  end

  def total_avg_sum
    sum = 0
    skills.each do |skill|
      sf = fetch_skill_feedbacks(skill)
      sum += (sf.sum(:score) * 1.0 / sf.count).round(2) unless sf.sum(:score).zero?
    end
    sum.round(2)
  end

  def count_max
    n = 0
    skills.each do |skill|
      sf = fetch_skill_feedbacks(skill)
      n = 1 unless sf.sum(:score).zero?
    end
    n *= 5.0
  end

  def total_result
    n = count_max
    sum = total_avg_sum
    return "0 из 0, 0%" if n.zero?
    "#{sum} из #{n}, #{sum * 100 / n}%"
  end

  def fetch_skill_feedbacks(skill)
    SkillFeedback.joins(:feedback).where("feedbacks.assessment_id = ?", assessment.id)
                 .where(skill: skill).where.not(score: nil)
  end
end
