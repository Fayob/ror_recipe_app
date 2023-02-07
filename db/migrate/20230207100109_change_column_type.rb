class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :measurement_unit, :string, default: 'grams'
    change_column :foods, :quantity, :integer, default: 0
  end
end
