require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  describe "validations" do
    it "is valid with a sensor id" do
      s = sensors(:sensor_1)
      result = s.valid?
      result.must_equal true
    end

    it "requires a sensor_id" do
      s = Sensor.new
      result = s.valid?
      result.must_equal false
      s.errors.messages.must_include :name
    end

    it "requires a value" do
      sensor.save
      s_not_uniq_name.valid?.must_equal false
      s_not_uniq_name.errors.messages.must_include :name
    end

  end

  describe "relationship" do
    it "has a sensor_id" do
      s = sensors(:sensor_1)
      s.readings.count.must_equal 1
    end

    it "has a value" do
      s = works(:sensor_3)
      s.readings.count.must_equal 0
    end
  end
end
