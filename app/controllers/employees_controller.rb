class EmployeesController < ApplicationController
  
  def index 
    # @employee = User.all
    # @employee = User.all.page(params[:page]).per(5)
    @employee = User.order(:name).page params[:page]
  end 

  def change_role
    @employee = User.find(params[:id])
    @employee.remove_role :employee if @employee.has_role? :employee
    @employee.add_role :admin unless @employee.has_role? :admin
    flash[:alert] = "admin have been sucessfully changed the role."
    redirect_to employees_path
  end

  def new
    @employee = User.new
  end
  
  def create
    @employee = User.new(user_params)

    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = User.find(params[:id])
  end

  def update
    @employee = User.find(params[:id])

    if @employee.update(user_params)
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = User.find(params[:id])
    @employee.destroy
    flash[:alert] = "User was successfully deleted."
    redirect_to employees_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :salary, :joining_date, :password,:date_of_birth, :organization_id)
    end
end
