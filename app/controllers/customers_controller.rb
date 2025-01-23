class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Клиент был успешно добавлен.'
    else
      render :new
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Данные клиента были успешно обновлены.'
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    if @customer.sales.any?
      flash[:alert] = 'Невозможно удалить клиента, так как он связан с продажами.'
    else
      @customer.destroy
      flash[:notice] = 'Клиент был успешно удален.'
    end
    redirect_to customers_url
  end

  private

  # Устанавливаем клиента для show, edit, update, destroy
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Разрешаем только доверенные параметры
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :email)
  end
end