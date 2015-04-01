class ContactsController<ApplicationController
  def new
    @contact = Contact.new
  end

  def populate

  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      flash[:notice] = @contact.name + " was added."
    else
      flash[:alert] = "There was a problem adding the contact"
    end
    response do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :number)
  end

end
