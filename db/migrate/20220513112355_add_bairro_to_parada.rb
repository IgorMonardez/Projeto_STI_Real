class AddBairroToParada < ActiveRecord::Migration[6.1]
  def change
    add_column :points, :bairro, :string
  end
end
