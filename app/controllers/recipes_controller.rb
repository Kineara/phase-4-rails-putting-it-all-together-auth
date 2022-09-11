class RecipesController < ApplicationController
  before_action :authorize 

  def index 
    recipes = Recipe.all 
    render json: recipes, include: :user, status: :created 
  end

  def create 
    recipe = Recipe.create(user_id: session[:user_id], title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete])
    if recipe.valid?
      render json: recipe, include: :user, status: :created 
    else
      render json: { errors: [] }, status: :unprocessable_entity
    end
  end

  private 

  def authorize 
    return render json: { errors: [] }, status: :unauthorized unless session.include? :user_id 
  end 
end
