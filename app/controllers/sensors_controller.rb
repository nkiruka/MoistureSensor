class SensorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @sensors =  Sensor.all
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
    # @readings = @sensor.readings.paginate(:page => params[:page], :per_page => 20)

    interval = 1 # 10 minutes is 600 seconds
    select_statment = "sensor_id, AVG(value) AS value, to_timestamp(floor((extract('epoch' from created_at) / #{interval})) * #{interval}) AT TIME ZONE 'UTC' AS interval_timestamp"

    @readings = @sensor.readings.select(select_statment)
                                .group("sensor_id, interval_timestamp")
                                .order("interval_timestamp desc")
                                .paginate(:page => params[:page],
                                          :per_page => 20)

    @sensor_readings = @sensor.readings.select(select_statment)
                              .group("sensor_id, interval_timestamp")
                              .order("interval_timestamp desc")
                              .map{|m| { time: m.interval_timestamp,
                                          value: m.value } }

  end

  def edit
    @sensor = Sensor.find(params[:id])
  end

  def update
    @sensor = Sensor.new(sensor_params)

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
    sensor = Sensor.find(params[:id])
    sensor.destroy

    respond_to do |format|
      format.html { redirect_to sensors_url, notice: 'Sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Only allow what is required.
  def sensor_params
    params.require(:sensor).permit(:name, :description, :model)
  end

end
