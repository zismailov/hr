class UserDecorator < ApplicationDecorator
  delegate :id,
    :role,
    :full_name,
    :email,
    :level,
    :profile_image,
    :hr?

  decorates_association :invites
  decorates_association :assessments
  decorates_association :department

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def full_name_with_role
    "#{object.full_name} (#{role_title})"
  end

  def department
    object.department.present? ? object.department.title : "Не указан"
  end

  def role_title
    User::ROLES[object.role]
  end

  def department_info
    "Отдел: #{department}"
  end

  def role_info
    "Должность: #{role_title}"
  end

  def email_info
    "Email: #{object.email}"
  end

  def level_info
    "Уровень: #{object.level}"
  end

  def role_with_level
    "#{role_title}, Уровень: #{object.level}"
  end

  def user_info
    if object.department.present?
      "#{object.full_name} (#{department}, #{role_title}, ур. #{object.level})"
    else
      "#{object.full_name} (#{role_title}, ур. #{object.level})"
    end
  end

  def next_assessment
    assessments = object.assessments.active.sorted_by_date.where("date >= ?", Time.zone.now)
    assessments.first.decorate if assessments.any?
  end
end
