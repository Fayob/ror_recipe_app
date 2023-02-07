class FoodRecipe < ApplicationRecord
  has_many :foods
  has_many :recipe
end