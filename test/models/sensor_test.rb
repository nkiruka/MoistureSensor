require 'test_helper'

class SensorTest < ActiveSupport::TestCase
  describe "validations" do
    it "is valid with a name" do
      s = sensors(:sensor_1)
      result = s.valid?
      result.must_equal true
    end

    it "must have a name" do
      s = Sensor.new
      result = s.valid?
      result.must_equal false
      s.errors.messages.must_include :name
    end

    it "requires a unique name" do
      sensor.save
      s_not_uniq_name.valid?.must_equal false
      s_not_uniq_name.errors.messages.must_include :name
    end

    it "must have a description" do
      is_valid = s_no_description.valid?
      is_valid.must_equal false
      s_no_description.errors.messages.must_include :description
    end
  end

  describe "relationship" do
    it "must have readings" do
      s = sensors(:sensor_1)
      s.readings.count.must_equal 1
    end

    it "does not have readings" do
      s = sensors(:sensor_3)
      s.readings.count.must_equal 0
    end
  end
end
