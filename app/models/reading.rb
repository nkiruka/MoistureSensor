class Reading < ApplicationRecord
  validates_presence_of :sensor_id
  validates_numericality_of :value  #numericality: { only_integer: true}
  # numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  # greater than or equal to zero, but can't be more than 100
end
