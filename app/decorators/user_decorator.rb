class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :level, :profile_image, :role, :department_id

  decorates_association :invites
  decorates_association :assessments
  decorates_association :department

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def full_name_with_role
    "#{object.full_name} (#{display_role})"
  end

  def department_info
    object.department.present? ? "Отдел: #{object.department.title}" : "Отдел: не указан"
  end

  def display_departmant
    object.department.present? ? object.department.title : "Отдел: не указан"
  end

  def role_info
    "Должность: #{User::ROLES[object.role.to_sym]}"
  end

  def display_role
    User::ROLES[object.role.to_sym]
  end

  def email_info
    "Email: #{object.email}"
  end

  def level_info
    "Уровень: #{object.level}"
  end

  def info
    "#{display_role}, Уровень: #{object.level}"
  end

  def next_assessment
    assessments = object.assessments.active.sorted_by_date.where("date >= ?", Time.zone.now)
    assessments.first.decorate if assessments.any?
  end
end
