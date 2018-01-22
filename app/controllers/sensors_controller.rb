class SensorsController < ApplicationController

  def index
    @sensors = Sensor.all
  end

  def new

  end

  def create

  end

  def show
    @sensor = Sensor.find_by(id: params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end



end
