class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  before_action :set_recipe, only: %i[new]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    if food_recipe_params[:food_id] == 'Add new food'
      @food = current_user.foods.new(food_params)
      respond_to do |format|
        if @food.save
          format.html { redirect_to food_url(@food), notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @food }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @food.errors, status: :unprocessable_entity }
        end
      end
    end

    return unless food_recipe_params[:recipe_id]
    new_food = food_recipe_params[:food_id] == 'Add new food'
    RecipeFood.create(food_id: new_food ? @food.id : food_recipe_params[:food_id], recipe_id: food_recipe_params[:recipe_id], Quantity: food_recipe_params[:Quantity])
    
    return if food_recipe_params[:food_id] == 'Add new food'
    @food = Food.find(food_recipe_params[:food_id])
    respond_to do |format|
      format.html { redirect_to food_url(@food), notice: 'Food was successfully added to the recipe.' }
      format.json { render :show, status: :created, location: @food }
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end  
  
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id]) if params[:recipe_id]
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  # Only allow a list of trusted parameters through with recipe id.
  def food_recipe_params
    params.require(:food).permit(:recipe_id, :Quantity, :food_id)
  end
end
