class RenameBairroAndAddBairroArrivalBairroToCarona < ActiveRecord::Migration[6.1]
  def change
    rename_column :caronas, :bairro, :bairro_departure
    add_column :caronas, :bairro_arrival, :string
  end
end
