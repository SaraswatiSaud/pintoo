class WebsitesController < ApplicationController
  def index
    @websites = current_user.websites.order(id: :desc).page params[:page]
  end

  def new
    @website = current_user.websites.new
  end

  def create
    @website = current_user.websites.friendly.new(website_params)
    if @website.save
      redirect_to @website
    else
      render 'new'
    end
  end

  def show
    @website = current_user.websites.friendly.find(params[:id])
  end

  def edit
    @website = current_user.websites.friendly.find(params[:id])
  end

  def update
    @website = current_user.websites.friendly.find(params[:id])
    if @website.update(website_params)
      redirect_to website_path
    else
      render 'edit'
    end
  end

  def destroy
    @website = current_user.websites.friendly.find(params[:id])
    @website.destroy
    redirect_to websites_path
  end

  private
  def website_params
    params.require(:website).permit(:name, :subdomain)
  end
end
