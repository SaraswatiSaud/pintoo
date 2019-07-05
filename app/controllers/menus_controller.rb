# frozen_string_literal: true

# Menus controller
class MenusController < ApplicationController
  def new
    @website = Website.friendly.find(params[:website_id])
    @menu = @website.menus.new
  end

  def create
    @website = Website.friendly.find(params[:website_id])
    @menu = @website.menus.new(menu_params)
    if @menu.save
      redirect_to website_menu_path(@website, @menu)
    else
      render 'new'
    end
  end

  def show
    @website = Website.friendly.find(params[:website_id])
    @menu = @website.menus.friendly.find(params[:id])
  end

  def edit
    @website = Website.friendly.find(params[:website_id])
    @menu = @website.menus.friendly.find(params[:id])
  end

  def update
    @website = Website.friendly.find(params[:website_id])
    @menu = Menu.friendly.find(params[:id])
    if @menu.update(menu_params)
      redirect_to website_menu_path(@website)
    else
      render 'edit'
    end
  end

  def destroy
    @website = Website.friendly.find(params[:website_id])
    @menu = Menu.friendly.find(params[:id])
    @menu.destroy
    redirect_to website_path(@website)
  end

  private

  def menu_params
    params.require(:menu).permit(:name)
  end
end
