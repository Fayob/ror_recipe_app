class ChangesToTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipees, :user, null: false, foreign_key: true
    add_reference :recipe_foods, :recipee, null: false, foreign_key: true
  end
end
