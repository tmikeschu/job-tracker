module CompaniesHelper
  def save_company(company)
    if company.save
      flash[:success] = "#{company.name} added!"
      redirect_to company_path(company)
    else
      @errors = company.errors.full_messages
      render :new
    end
  end

  def update_company(company, company_params)
    if company.update(company_params)
      flash[:success] = "#{company.name} updated!"
      redirect_to company_path(company)
    else
      @errors = company.errors.full_messages
      render :edit
    end
  end

  def destroy_company(company)
    company.destroy
    flash[:success] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end

  def alphabetical_companies
    current_user.companies.order(:name)
  end
end