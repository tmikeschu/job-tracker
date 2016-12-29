module ContactsHelper
  def save_contact(contact)
    if contact.save
      flash[:success] = "#{contact.first_name + " " + contact.last_name} added!"
      redirect_to company_path(contact.company)
    else
      @company.reload
      @contacts = @company.contacts
      @errors = contact.errors.full_messages
      render "jobs/index"
    end
  end
end
