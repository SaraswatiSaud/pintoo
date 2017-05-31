class WebsitesController < ApplicationController
  def index
    @websites = current_user.websites
  end

  def new
  end

  def create
    @website = current_user.websites.new(website_params)
    @website.save
    redirect_to @website
  end

  def show
    @website = current_user.websites.find(params[:id])
  end

  private
  def website_params
    params.require(:website).permit(:name, :subdomain)
  end
end
