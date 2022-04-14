class ShoppingListController < ApplicationController
  def index
    @foods = current_user.foods.includes(:recipe_foods)
  end
end
