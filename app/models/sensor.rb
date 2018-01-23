class Sensor < ApplicationRecord
  has_many :readings
  
  validates :name, presence: true, uniqueness: true
end
