FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    afm { Faker::Number.number(9) }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
