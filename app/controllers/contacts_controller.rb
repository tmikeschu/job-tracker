class ContactsController < ApplicationController
  include ContactsHelper
  
  before_action :set_company, only: [:create, :show]

  def create
    @jobs = @company.jobs
    @contact = @company.contacts.new(contact_params)
    @contact.user_id = current_user.id
    save_contact(@contact)
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
