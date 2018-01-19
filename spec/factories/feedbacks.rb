FactoryGirl.define do
  factory :feedback do
    user
    assessment

    factory :feedback_with_skill_feedbacks do
      transient do
        skill_feedbacks_count 5
      end

      after(:create) do |feedback, evaluator|
        create_list(:skill_feedback, evaluator.skill_feedbacks_count, feedback: feedback)
      end
    end
  end
end
