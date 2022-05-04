class CreateCaronas < ActiveRecord::Migration[6.1]
  def change
    create_table :caronas do |t|
      t.integer :preco
      t.integer :qtd_passageiros
      t.datetime :date_hour
      t.string :departure
      t.string :arrival
      t.references :users

      t.timestamps
    end
  end
end
