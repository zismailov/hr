FactoryGirl.define do
  factory :assessment do
    user
    date { Time.zone.today }
  end

  trait :apply_for_hr do
    role "hr"
  end

  trait :apply_for_manager do
    role "manager"
  end

  trait :apply_for_lead_dev do
    role "lead_dev"
  end

  trait :apply_for_senior_dev do
    role "senior_dev"
  end

  trait :apply_for_middle_dev do
    role "middle_dev"
  end

  trait :apply_for_junior_dev do
    role "junior_dev"
  end
end
