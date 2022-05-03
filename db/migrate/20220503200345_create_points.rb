class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.references :carona, null: false, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
