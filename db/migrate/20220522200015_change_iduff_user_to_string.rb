class ChangeIduffUserToString < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :iduff, :string
  end
end
