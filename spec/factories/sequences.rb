FactoryGirl.define do
  sequence(:hr_email)         { |n| "hr_#{n}@flatstack.com" }
  sequence(:manager_email)    { |n| "manager_#{n}@flatstack.com" }
  sequence(:lead_dev_email)   { |n| "lead_developer_#{n}@flatstack.com" }
  sequence(:senior_dev_email) { |n| "senior_developer_#{n}@flatstack.com" }
  sequence(:middle_dev_email) { |n| "middle_developer_#{n}@flatstack.com" }
  sequence(:junior_dev_email) { |n| "junior_developer_#{n}@flatstack.com" }

  sequence(:title) { |n| "#{Faker::Lorem.words} #{n}" }
end
