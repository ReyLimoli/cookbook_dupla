class RecipesController < ApplicationController
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipes_types = RecipeType.all
  end

  def create
        
    @recipe = Recipe.create(recipe_params)
    if @recipe.save      
    redirect_to  @recipe
    else
      @recipes_types = RecipeType.all
      render "new"
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @recipes_types = RecipeType.all
  end

  def update
    
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      @recipes_types = RecipeType.all
      render "edit"
    end   

  end

  private
  #Os metodos abaixo do private serão tratados como metodos e não como actions

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id,
                                   :cuisine, :difficulty,
                                   :cook_time, :ingredients,
                                   :cook_method)    
  end 

end