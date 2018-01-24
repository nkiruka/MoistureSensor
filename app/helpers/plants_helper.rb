module PlantsHelper
  def check_threshold
    @plant.readings.each do |reading|
      if reading > @plant.threshold
        "red"
      end
    end
  end
end
