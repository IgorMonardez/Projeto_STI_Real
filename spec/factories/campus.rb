FactoryBot.define do
  factory :campu do
    address { Faker::Address.street_name }
    nome { Faker::Address.name }
    numero { Faker::Address.building_number }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city }
    cep { Faker::Address.postcode }
  end
end

