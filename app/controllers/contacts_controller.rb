class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
  end

    private

  def post_params
    params.require(:contact).permit(:phone, :name, :user_id)
  end

end
