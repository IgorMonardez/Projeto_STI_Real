FactoryBot.define do
  factory :carona do
    preco { Faker::Commerce.price }
    qtd_passageiros { 4 }
    date_hour { Faker::Date.in_date_period }
    departure { Faker::Address.street_address }
    arrival { Faker::Address.street_address }
    user_id { Faker::Number.leading_zero_number(digits: 11) }
  end
end

