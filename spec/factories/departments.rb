FactoryGirl.define do
  factory :department do
    title { generate(:department_title) }
  end
end
