class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

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

    if @sale.save
      redirect_to @sale, notice: 'Продажа была успешно добавлена.'
    else
      render :new
    end
  end

  # PATCH/PUT /sales/1
  def update
    if @sale.update(sale_params)
      redirect_to @sale, notice: 'Продажа была успешно обновлена.'
    else
      render :edit
    end
  end

  # DELETE /sales/1
  def destroy
    @sale.destroy
    redirect_to sales_url, notice: 'Продажа была успешно удалена.'
  end

  private
  # Устанавливаем продажу для действия show, edit, update, destroy
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Разрешаем только доверенные параметры
  def sale_params
    params.require(:sale).permit(:car_id, :customer_id, :employee_id, :sale_price)
  end
end