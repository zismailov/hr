FactoryBot.define do
  factory :skill do
    title
    department
    description { Faker::Lorem.sentence }
  end

  trait :lead_dev_skill do
    role "Lead Developer"
  end

  trait :senior_dev_skill do
    role "Senior Developer"
  end

  trait :middle_dev_skill do
    role "Middle Developer"
  end

  trait :junior_dev_skill do
    role "Junior Developer"
  end
end
