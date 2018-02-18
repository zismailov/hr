class AssessmentComments
  attr_reader :assessment, :skills

  def initialize(assessment)
    @assessment = assessment
    @skills = Skill.active.where(role: assessment.requested_role, department: [assessment.user.department, nil])
  end

  def results
    {
      head: head,
      body: body
    }
  end

  private

  def head
    result = []
    assessment.feedbacks.each do |feedback|
      result << feedback.user.full_name
    end
    result
  end

  def body
    result = []
    skills.each do |skill|
      result << [skill.title, skill.id, *skill_comment(skill)]
    end
    result
  end

  def skill_comment(skill)
    result = []
    assessment.feedbacks.each do |feedback|
      sf = feedback.skill_feedbacks.where(skill: skill).first

      return "Нет отзыва" unless sf

      result << (sf.comment.presence || "Нет отзыва")
    end
    result
  end
end
