class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.all
  end

  # GET /employees/:id
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: 'Сотрудник был успешно добавлен.'
    else
      render :new
    end
  end

  # GET /employees/:id/edit
  def edit
  end

  # PATCH/PUT /employees/:id
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Сотрудник был успешно обновлен.'
    else
      render :edit
    end
  end

  # DELETE /employees/:id
  def destroy
    if @employee.sales.any?
      flash[:alert] = 'Невозможно удалить сотрудника, так как он связан с продажами.'
      redirect_to employees_url
    else
      @employee.destroy
      flash[:notice] = 'Сотрудник был успешно удален.'
      redirect_to employees_url
    end
  end

  private
  def set_employee
    @employee = Employee.find(params[:id])
  end
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :salary)
  end
end