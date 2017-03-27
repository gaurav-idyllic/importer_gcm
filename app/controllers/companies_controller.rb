class CompaniesController < ApplicationController
  def index
    @company_names = Company.order(:company).pluck(:company).uniq
  end

  def get_data
    @data = CompanyService.new.get_data(params[:company], params[:page])
  end
end
