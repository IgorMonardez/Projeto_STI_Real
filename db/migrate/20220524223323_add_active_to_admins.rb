class AddActiveToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :active, :boolean, default: true
  end
end
