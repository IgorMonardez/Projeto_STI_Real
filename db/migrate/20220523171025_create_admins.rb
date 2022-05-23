class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :iduff
      t.string :nome
      t.string :email

      t.timestamps
    end
  end
end
