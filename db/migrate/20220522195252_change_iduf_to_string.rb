# frozen_string_literal: true

class ChangeIduffToString < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :iduff, :string
  end
end
