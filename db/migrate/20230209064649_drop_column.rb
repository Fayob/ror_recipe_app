class DropColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :recipe_id
  end
end
