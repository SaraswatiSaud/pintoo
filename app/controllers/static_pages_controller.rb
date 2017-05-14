class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def index
  end

  def contact
  end

  def dashboard
  end
end
