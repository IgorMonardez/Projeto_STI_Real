# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    iduff { Faker::Number.leading_zero_number(digits: 11) }
  end
end
