class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
    @car = Car.find(params[:id])
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Машина была успешно добавлена.' }
        format.json { render :show, status: :created, location: @car }
      else

        format.html {
          render :new, status: :unprocessable_entity
          flash.now[:alert] = @car.errors.full_messages.to_sentence
        }
        format.json { render json: { errors: @car.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      if car_params[:images].present?

        @car.images.attach(car_params[:images])
      end


      if @car.update(car_params.except(:images))
        format.html { redirect_to @car, notice: 'Машина была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @car }
      else

        format.html {
          flash.now[:alert] = @car.errors.full_messages.to_sentence
          render :edit, status: :unprocessable_entity
        }
        format.json { render json: { errors: @car.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Машина была успешно удалена.' }
      format.json { head :no_content }
    end
  rescue ActiveRecord::InvalidForeignKey => e
    respond_to do |format|
      format.html { redirect_to cars_url, alert: 'Невозможно удалить машину, так как она связана с продажами.' }
      format.json { render json: { error: 'Невозможно удалить машину, так как она связана с продажами.' }, status: :unprocessable_entity }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:brand, :model, :price, :year, :description,images: [])
  end
end