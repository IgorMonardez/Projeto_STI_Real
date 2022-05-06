FactoryBot.define do
  factory :point do
    carona_id
    address { Faker::Address.street_address }
  end
end

