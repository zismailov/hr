FactoryBot.define do
  factory :skill do
    title
    department
    description { Faker::Lorem.sentence }
  end

  trait :hr_skill do
    role "hr"
  end

  trait :manager_skill do
    role "manager"
  end

  trait :lead_dev_skill do
    role "lead_dev"
  end

  trait :senior_dev_skill do
    role "senior_dev"
  end

  trait :middle_dev_skill do
    role "middle_dev"
  end

  trait :junior_dev_skill do
    role "junior_dev"
  end

  trait :designer_skill do
    role "designer"
  end
end
