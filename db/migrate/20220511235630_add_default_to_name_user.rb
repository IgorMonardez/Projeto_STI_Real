class AddDefaultToNameUser < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :name, ""
    change_column_default :users, :iduff, 00_000_000_000

  end
end
