# frozen_string_literal: true

class AddDefaulteActiveToAdmin < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :active
    add_column :admins, :active, :boolean, default: true
  end
end
