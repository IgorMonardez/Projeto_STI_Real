# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    nome { Faker::Name.name }
    iduff { Faker::Number.number(digits: 11) }
  end
end
