class AssessmentComments
  attr_reader :assessment, :skills

  def initialize(assessment)
    @assessment = assessment
    @skills = Skill.where(role: User.roles[assessment.requested_role], department: [assessment.user.department, nil])
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
      result << [skill.title, *skill_comment(skill)]
    end
    result
  end

  def skill_comment(skill)
    result = []
    assessment.feedbacks.each do |feedback|
      comment = SkillFeedback.find_by(feedback: feedback, skill: skill).comment
      result << (comment.empty? ? "Нет отзыва" : comment)
    end
    result
  end
end
