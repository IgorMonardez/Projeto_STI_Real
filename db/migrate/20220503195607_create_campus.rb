# frozen_string_literal: true

class CreateCampus < ActiveRecord::Migration[6.1]
  def change
    create_table :campus do |t|
      t.string :address, null: false, default: ''
      t.string :nome, null: false, default: ''
      t.integer :numero, null: true
      t.string :bairro, null: false, default: ''
      t.string :cidade, null: false, default: ''
      t.integer :cep, null: false, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
