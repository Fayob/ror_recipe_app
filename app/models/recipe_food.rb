class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipee
end
