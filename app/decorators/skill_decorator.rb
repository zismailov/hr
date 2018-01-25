class SkillDecorator < ApplicationDecorator
  delegate :title, :description, :department_id

  def department
    object.department.present? ? object.department.title : "Личностные качества"
  end

  def role
    Skill.roles[object.role]
  end

  def skill_info
    "#{department}, #{role}"
  end
end
