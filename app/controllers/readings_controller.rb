class ReadingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @readings = Reading.all
  end

  def show
  end


  def new

  end

  def edit
  end

  def create

  end


  def update

  end

  def destroy

  end


end
