class AddNameIduffActiveToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :name, :string
    add_column :admins, :iduff, :bigint
    add_column :admins, :active, :boolean
  end
end
