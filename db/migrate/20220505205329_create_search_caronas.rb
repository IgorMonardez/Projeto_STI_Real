class CreateSearchCaronas < ActiveRecord::Migration[6.1]
  def change
    create_table :search_caronas do |t|
      t.string :partida
      t.string :chegada
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
