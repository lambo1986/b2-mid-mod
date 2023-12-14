class DepartmentEmployeesController < ApplicationController
  def index
    @department = Department.find(params[:department_id])
    @department_employees = @department.employees
  end
end
