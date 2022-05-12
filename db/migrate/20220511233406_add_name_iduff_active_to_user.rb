class AddNameIduffActiveToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :iduff, :bigint, null: false
    add_column :users, :active, :boolean, default: true
  end
end
