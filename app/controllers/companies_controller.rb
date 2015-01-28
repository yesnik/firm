class CompaniesController < ApplicationController
  def index
  	@companies = Company.all
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

	  if @company.valid? and @employee.valid?
      @company.save
      @employee.save
	    redirect_to companies_path
	  else
	    render 'new'
	  end
	end
 
private
  def company_params
    params.require(:company).permit(:title)
  end

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name)
  end
end
