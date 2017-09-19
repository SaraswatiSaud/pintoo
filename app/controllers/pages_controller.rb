class PagesController < ApplicationController
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else
      render 'new'
    end
  end

  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(pages_params)
      redirect_to pages_path
    else
      render 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  private
  def pages_params
    params.require(:page).permit(:name)
  end
end
