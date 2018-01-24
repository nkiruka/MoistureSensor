class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    plant = Plant.new(plant_params)
    if plant.save
    render json: { id: plant.id }, status: :ok
    else
    render json: { errors: plant.errors.messages },
      status: :bad_request
    end
  end

  def show
    @plant = Plant.find_by(id: params[:id])
  end

  def edit
    @plant = Plant.find_by(id: params[:id])
  end

  def update
    @plant = Plant.new(sensor_params)

    respond_to do |format|
      if @plant.update(sensor_params)
        format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    plant = Plant.find(params[:id])
    plant.destroy

    respond_to do |format|
      format.html { redirect_to plants_url, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :threshold)
  end

end
