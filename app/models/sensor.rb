class Sensor < ApplicationRecord
  has_many :readings
  has_one  :plant
  
  # validates :name, presence: true, uniqueness: true
end
