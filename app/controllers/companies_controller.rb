class CompaniesController < ApplicationController
  def index
    if params[:director_surname]
      @companies = Company.joins(:employees)
        .where(employees: {last_name: params[:director_surname], 
          position_id: Position::DIRECTOR_ID})
    else
  	 @companies = Company.all
    end
  end

  def new
  	@company = Company.new
  	@employee = Employee.new
  end

  def show
  	@company = Company.find(params[:id])
  end

  def create
	  @company = Company.new(company_params)
    @employee = Employee.new(employee_params)
    @employee.position_id = Position::DIRECTOR_ID

	  if @company.valid? and @employee.valid?
      @company.save
      @employee.save
	    redirect_to companies_path
	  else
	    render 'new'
	  end
	end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      flash[:success] = I18n.t('app.flash.delete_successful')
      redirect_to companies_path
    else
      flash[:danger] = @company.errors.full_messages.first
      redirect_to companies_path
    end
  end
 
private
  def company_params
    params.require(:company).permit(:title, :director_surname)
  end

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name)
  end
end
