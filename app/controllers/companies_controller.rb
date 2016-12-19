class CompaniesController < ApplicationController
  include CompaniesHelper

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    save_company(@company)
  end

  def show
    redirect_to company_jobs_path(@company)
  end

  def edit
  end

  def update
    update_company(@company, company_params)
  end

  def destroy
    destroy_company(@company)
  end

    private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :city)
    end
end
