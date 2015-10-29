class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)  
    @recipe.chef = Chef.find_by(id: 1)
    
    if @recipe.save
      flash[:success] = "Recipe #{@recipe.name} has been created successfully."
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def update
    @recipe = Recipe.find_by(id: params[:id])
    
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "Recipe has been updated successfully"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :picture)
  end
end