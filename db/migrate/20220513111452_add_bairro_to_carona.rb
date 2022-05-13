class AddBairroToCarona < ActiveRecord::Migration[6.1]
  def change
    add_column :caronas, :bairro, :string
  end
end
