# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  before_action :find_page

  def new
    @page = @website.pages.new
  end

  def create
    @page = @website.pages.new(page_params)
    if @page.save
      redirect_to website_page_path(@website, @page)
    else
      render 'new'
    end
  end

  def show
    @page = @website.pages.friendly.find(params[:id])
  end

  def edit
    @page = @website.pages.friendly.find(params[:id])
  end

  def update
    @page = Page.friendly.find(params[:id])
    if @page.update(page_params)
      redirect_to website_page_path(@website)
    else
      render 'edit'
    end
  end

  def destroy
    @page = Page.friendly.find(params[:id])
    @page.destroy
    redirect_to website_path(@website)
  end

  private

  def find_page
    @website = Website.friendly.find(params[:website_id])
  end

  def page_params
    params.require(:page).permit(:name, :content)
  end
end
