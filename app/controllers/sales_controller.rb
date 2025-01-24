class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :set_dependencies, only: [:new, :edit]
  # GET /sales
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @cars = Car.all
    @customers = Customer.all
    @employees = Employee.all

  end

  # GET /sales/1/edit
  def edit
    @cars = Car.all
    @customers = Customer.all
    @employees = Employee.all
  end

  # POST /sales
  def create
    @sale = Sale.new(sale_params)
    @cars = Car.all
    @customers = Customer.all
    @employees = Employee.all

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Продажа успешно добавлена.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Продажа успешно обновлена.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  def destroy
    @sale.destroy
    redirect_to sales_url, notice: 'Продажа была успешно удалена.'
  end

  private
  def set_sale
    @sale = Sale.find(params[:id])
  end
  private

  def set_dependencies
    @cars = Car.all
    @customers = Customer.all
    @employees = Employee.all
  end
  def sale_params
    params.require(:sale).permit(:car_id, :customer_id, :employee_id, :sale_price)
  end
end