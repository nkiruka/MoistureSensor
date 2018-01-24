class Plant < ApplicationRecord
  has_many :readings
  has_many :sensors, :through => :readings

  # def check_threshold
  #   @plant.readings.each do |reading|
  #     if reading > @plant.threshold
  #       return "red"
  #     end
  #   end
  # end
end
