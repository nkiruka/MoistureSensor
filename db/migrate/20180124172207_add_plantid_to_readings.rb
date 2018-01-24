class AddPlantidToReadings < ActiveRecord::Migration[5.1]
  def change
    add_column :readings, :plant_id, :integer
  end
end
