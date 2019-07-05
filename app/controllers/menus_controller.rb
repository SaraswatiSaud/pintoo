# frozen_string_literal: true

# Menus controller
class MenusController < ApplicationController
  before_action :find_menu

  def new
    @menu = @website.menus.new
  end

  def create
    @menu = @website.menus.new(menu_params)
    if @menu.save
      redirect_to website_menu_path(@website, @menu)
    else
      render 'new'
    end
  end

  def show
    @menu = @website.menus.friendly.find(params[:id])
  end

  def edit
    @menu = @website.menus.friendly.find(params[:id])
  end

  def update
    @menu = Menu.friendly.find(params[:id])
    if @menu.update(menu_params)
      redirect_to website_menu_path(@website)
    else
      render 'edit'
    end
  end

  def destroy
    @menu = Menu.friendly.find(params[:id])
    @menu.destroy
    redirect_to website_path(@website)
  end

  private

  def find_menu
    @website = Website.friendly.find(params[:website_id])
  end

  def menu_params
    params.require(:menu).permit(:name)
  end
end
