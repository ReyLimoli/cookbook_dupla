class WelcomeController < ApplicationController
  def index
    
    @featured_recipes = Recipe.where(featured: true)

    @another_recipes = Recipe.where(featured: false)
  end
end