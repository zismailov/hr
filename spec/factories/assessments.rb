FactoryGirl.define do
  factory :assessment do
    user
    date { Faker::Date.forward(1) }
  end
end
