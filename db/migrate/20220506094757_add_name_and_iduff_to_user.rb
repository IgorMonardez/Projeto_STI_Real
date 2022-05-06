class AddNameAndIduffToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :iduff, :bigint
    add_column :users,:active, :boolean, default: true
  end
end
