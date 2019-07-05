# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
end
