FactoryBot.define do
  factory :skill_feedback do
    association :skill, factory: :skill, role: "senior_dev"
    feedback
    comment { Faker::Lorem.sentence }
    score { Faker::Number.between(1, 5) }
  end
end
