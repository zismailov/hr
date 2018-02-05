FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    email { generate :hr_email }
    password "123456"
    password_confirmation { password }
    level 1
    department
    confirmed_at { 1.hour.ago }
  end

  trait :hr do
    email { generate :hr_email }
    role "HR"
  end

  trait :manager do
    email { generate :manager_email }
    role "Менеджер"
  end

  trait :lead_dev do
    email { generate :lead_dev_email }
    role "Lead Developer"
  end

  trait :senior_dev do
    email { generate :senior_dev_email }
    role "Senior Developer"
  end

  trait :middle_dev do
    email { generate :middle_dev_email }
    role "Middle Developer"
  end

  trait :junior_dev do
    email { generate :junior_dev_email }
    role "Junior Developer"
  end

  trait :employee do
    email { generate :junior_dev_email }
    role "Сотрудник"
  end

  trait :not_confirmed do
    confirmed_at nil

    after(:create) do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end
end
