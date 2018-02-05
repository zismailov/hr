FactoryBot.define do
  factory :assessment do
    user
    date { Time.zone.today }
  end

  trait :requested_role_hr do
    requested_role "hr"
  end

  trait :requested_role_manager do
    requested_role "manager"
  end

  trait :requested_role_lead_dev do
    requested_role "lead_dev"
  end

  trait :requested_role_senior_dev do
    requested_role "senior_dev"
  end

  trait :requested_role_middle_dev do
    requested_role "middle_dev"
  end

  trait :requested_role_junior_dev do
    requested_role "junior_dev"
  end
end
