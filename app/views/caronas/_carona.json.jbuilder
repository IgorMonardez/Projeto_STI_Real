json.extract! carona, :id, :preco, :qtd_passageiros, :date_hour, :departure, :arrival, :created_at, :updated_at
json.url carona_url(carona, format: :json)
