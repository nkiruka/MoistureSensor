class AddPlantidToSensors < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :plant_id, :integer
  end
end
