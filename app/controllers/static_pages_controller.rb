# frozen_string_literal: true

# Static pages controller
class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def index; end

  def contact; end

  def dashboard; end

  def settings; end
end
