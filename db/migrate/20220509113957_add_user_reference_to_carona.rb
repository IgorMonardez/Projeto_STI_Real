class AddUserReferenceToCarona < ActiveRecord::Migration[6.1]
  def change
    add_reference :caronas, :user, index: true, null: false, foreign_keys: true
  end
end
