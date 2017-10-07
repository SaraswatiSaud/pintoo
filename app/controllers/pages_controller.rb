class PagesController < ApplicationController
  def new
    @website = Website.friendly.find(params[:website_id])
    @page = @website.pages.new
  end

  def create
    @website = Website.friendly.find(params[:website_id])
    @page = @website.pages.new(page_params)
    if @page.save
      redirect_to website_page_path(@website, @page)
    else
      render 'new'
    end
  end

  def show
    @website = Website.friendly.find(params[:website_id])
    @page = @website.pages.friendly.find(params[:id])
  end

  def edit
    @website = Website.friendly.find(params[:website_id])
    @page = @website.pages.friendly.find(params[:id])
  end

  def update
    @website = Website.friendly.find(params[:website_id])
    @page = Page.friendly.find(params[:id])
    if @page.update(page_params)
      redirect_to website_path(@website)
    else
      render 'edit'
    end
  end

  def destroy
    @website = Website.friendly.find(params[:website_id])
    @page = Page.friendly.find(params[:id])
    @page.destroy
    redirect_to website_path(@website)
  end

  private
  def page_params
    params.require(:page).permit(:name)
  end
end
