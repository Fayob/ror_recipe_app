class ChangeFood < ActiveRecord::Migration[7.0]
  def change
    change_column(:foods, :measurement_unit, :string, default: '')
  end
end
