FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    sequence(:email) {|n| "test#{n}@example.com"}
    password "password"

    trait :admin do
      admin true
    end
  end
end
