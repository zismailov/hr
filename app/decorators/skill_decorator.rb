class SkillDecorator < ApplicationDecorator
  delegate :title, :role, :description, :department_id

  def department
    object.department.present? ? object.department.title : "Личностные качества"
  end

  def role_title
    User::ROLES[object.role]
  end

  def skill_info
    "#{department}, #{role_title}"
  end
end
