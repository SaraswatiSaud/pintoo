class MenuItemsController < ApplicationController
  def index
    @menuitems = MenuItem.all
  end
end
