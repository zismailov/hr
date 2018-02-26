FactoryBot.define do
  sequence(:email) { |n| "user_#{n}@example.com" }
  sequence(:hr_email) { |n| "hr_#{n}@example.com" }
  sequence(:manager_email) { |n| "manager_#{n}@example.com" }
  sequence(:lead_dev_email) { |n| "lead_developer_#{n}@example.com" }
  sequence(:senior_dev_email) { |n| "senior_developer_#{n}@example.com" }
  sequence(:middle_dev_email) { |n| "middle_developer_#{n}@example.com" }
  sequence(:junior_dev_email) { |n| "junior_developer_#{n}@example.com" }
  sequence(:designer_email) { |n| "designer_#{n}@example.com" }

  sequence(:title) { |n| "Title_#{n}" }
  sequence(:department_title) { |n| "Department_#{n}" }
end
