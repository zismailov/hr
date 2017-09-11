FactoryGirl.define do
  factory :skill_feedback do
    skill
    feedback
    comment { Faker::Lorem.sentence }
    score { Faker::Number.between(1, 5) }
  end
end
