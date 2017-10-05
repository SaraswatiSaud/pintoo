class PagesController < ApplicationController
  def index
    @website = Website.find(params[:website_id])
    @pages = @website.pages
  end

  def show
    @website = Website.find(params[:website_id])
    @page = @website.pages.find(params[:id])
  end

  def new
    @website = Website.find(params[:website_id])
    @page = @website.pages.new
  end

  def create
    @website = Website.find(params[:website_id])
    @page = @website.pages.new(page_params)
    if @page.save
      redirect_to pages_path
    else
      render 'new'
    end
  end

  def edit
    @website = Website.find(params[:website_id])
    @page = @website.pages.find(params[:id])
  end

  def update
    @website = Website.find(params[:website_id])
    @page = @website.pages.find(params[:id])
    if @page.update(page_params)
      redirect_to pages_path
    else
      render 'edit'
    end
  end

  def destroy
    @website = Website.find(params[:website_id])
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  private
  def page_params
    params.require(:page).permit(:name)
  end
end
