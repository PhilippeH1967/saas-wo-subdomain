FactoryBot.define do


  factory :user do # a user should have a name, a last name, a email, a role and a password
    sequence(:email) { |n| "user_#{n}@factory.com" }
    first_name "John"
    last_name "Doe"
    fullname "joe test"
    # email "test@test1.com"
    password "password"
    password_confirmation "password"
    capacity        40
    cost            10
    employee        false
    active          false
    role "user"

  end
end