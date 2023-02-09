class ChangeTable < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :preparation_time, :string
    change_column :recipes, :cooking_time, :string
    change_column :recipes, :public, :boolean, default: false
  end
end
