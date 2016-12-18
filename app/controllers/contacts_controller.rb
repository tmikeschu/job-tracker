class ContactsController < ApplicationController
  before_action :set_company, only: [:create, :show]

  def create
    @jobs = @company.jobs
    @contact = Contact.new(contact_params)
    @contact.company_id = @company.id
    if @contact.save
      flash[:success] = "#{@contact.first_name + " " + @contact.last_name} added!"
      redirect_to company_path(@company)
    else
      @contacts = @company.contacts
      @errors = @contact.errors.full_messages
      render "jobs/index"
    end
  end

  def index
    @contacts = @company.contacts
    redirect_to company_path(company)
  end

  private
    def set_company
      @company = Company.find(params[:company_id])
    end
    
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :position, :email)
    end
end
