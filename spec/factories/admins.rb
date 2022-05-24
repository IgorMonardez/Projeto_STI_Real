# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    nome { Faker::Name.name }
    iduff { '08225892739' }
  end
end
