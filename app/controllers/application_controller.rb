# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  # protect_from_forgery with: :exception, prepend: true
  helper_method :logged_user
  authenticate_with_iduff_keycloak
end
