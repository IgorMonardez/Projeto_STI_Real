# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def funky_method
    "#{name}.camelize"
  end
end
