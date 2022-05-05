class AddUsersToCaronas < ActiveRecord::Migration[6.1]
  def change
    add_reference :caronas, :users, null: false, foreign_key: true
  end
end
