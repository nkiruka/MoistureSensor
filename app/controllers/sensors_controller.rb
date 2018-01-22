class SensorsController < ApplicationController

  def index
    @sensors = Sensor.all
  end

  def new
    @sensor = Sensor.new
  end

  def create
    @sensor = Sensor.new(sensor_params)
    if @sensor.save
    render json: { id: @sensor.id }, status: :ok
    else
    render json: { errors: @sensor.errors.messages },
      status: :bad_request
    end
  end

  def show
    @sensor = Sensor.find_by(id: params[:id])
  end

  def edit
    @sensor = Sensor.find_by(id: params[:id])
  end

  def update
    @sensor = Sensor.find_by(id: params[:id])
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to @sensor, notice: 'Sensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  # Never trust parameters from the scary internet, only allow what is required.
  def sensor_params
    params.require(:sensor).permit(:name, :description, :model)
  end



end
