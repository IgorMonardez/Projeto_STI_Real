class CreateCampus < ActiveRecord::Migration[6.1]
  def change
    create_table :campus do |t|
      t.string :address
      t.string :nome
      t.integer :numero
      t.string :bairro
      t.string :cidade
      t.integer :cep



      t.timestamps
    end
  end
end
