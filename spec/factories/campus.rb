FactoryBot.define do
  factory :campu do
    address { Faker::Address.street_name }
    nome { Faker::University.name }
    numero { Faker::Address.building_number.to_i }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city }
    cep { Faker::Address.postcode.to_i }
  end
end

