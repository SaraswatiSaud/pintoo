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

  def edit
    @website = current_user.websites.find(params[:id])
  end

  def update
    @website = current_user.websites.find(params[:id])
    @website.update(website_params)
    redirect_to websites_path
  end

  def destroy
    @website = current_user.websites.find(params[:id])
    @website.destroy
    redirect_to websites_path
  end

  private
  def website_params
    params.require(:website).permit(:name, :subdomain)
  end
end
