class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new(contact_params)
    @contact.company_id = @company.id
    if @contact.save
      flash[:success] = "#{@contact.first_name + " " + @contact.last_name} added!"
      redirect_to company_path(@company)
    else
      @errors = @contact.errors.full_messages
      render "jobs/index"
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email)
    end
end
