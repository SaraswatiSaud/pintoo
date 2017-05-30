class WebsitesController < ApplicationController
  def index
    @websites = current_user.websites
  end

  def new
  end

  def create
  end

  def show
    @website = current_user.websites.find(params[:id])
  end
end
