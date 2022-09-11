class Recipe < ApplicationRecord
  belongs_to :user 
  validates :title, presence: true 
  validates :instructions, length: {minimum: 50}

  def create 
    recipe = recipe.create(title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete])
  end
end
