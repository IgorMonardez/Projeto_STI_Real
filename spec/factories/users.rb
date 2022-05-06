FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    iduff { Faker::IDNumber.brazilian_citizen_number }
    encrypted_password { Faker::Internet.password(6) }
  end
end
