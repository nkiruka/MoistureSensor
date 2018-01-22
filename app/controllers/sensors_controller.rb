class SensorsController < ApplicationController

  def index
    @sensors = Sensor.all
  end

  def new
    @sensor = Sensor.new
  end

  def create
    sensor = Sensor.new(sensor_params)
    if sensor.save
    render json: { id: sensor.id }, status: :ok
    else
    render json: { errors: sensor.errors.messages },
      status: :bad_request
    end
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

  private

  # Never trust parameters from the scary internet, only allow what is required.
  def sensor_params
    params.require(:sensor).permit(:name, :description, :model)
  end



end
