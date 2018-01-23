FactoryGirl.define do
  factory :skill do
    description { Faker::Lorem.sentence }
    department
  end
end
