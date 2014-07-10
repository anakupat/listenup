FactoryGirl.define do
  factory :user do
    # We use a sequence to make sure that every User that is created has a
    # unique email.
    sequence(:email) { |n| "email#{n}@example.com" }
    password "password123"
    sequence(:username) { |n| "username#{n}"}
    first_name "Chris"
    last_name "Finlayson"
  end
end
