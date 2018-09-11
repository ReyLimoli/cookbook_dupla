class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe_params = params.require(:recipe).permit(:title, :recipe_type,
                                                    :cuisine, :difficulty,
                                                    :cook_time, :ingredients,
                                                    :cook_method)
    @recipe = Recipe.create(recipe_params)

    redirect_to recipe_path(@recipe.id)
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe_params = params.require(:recipe).permit(:title, :recipe_type,
                                                    :cuisine, :difficulty,
                                                    :cook_time, :ingredients,
                                                    :cook_method)
    @recipe = Recipe.find(params[:id])

    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe.id)

  end


end