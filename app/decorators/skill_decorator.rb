class SkillDecorator < ApplicationDecorator
  delegate_all

  def skill_description
    "Навык: #{object.description}"
  end

  def department_title
    object.department.title
  end
end
