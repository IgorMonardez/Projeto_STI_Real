# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    iduff { Faker::IDNumber.brazilian_citizen_number }
    encrypted_password { Faker::Internet.password(6) }
  end
end
