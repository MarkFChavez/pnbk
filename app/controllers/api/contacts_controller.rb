module Api
  class ContactsController < Api::BaseController
    respond_to :json

    def index
      @contacts = Contact.all
      respond_with @contacts
    end

    def show
      @contact = Contact.find(params[:id])
      respond_with @contact
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.save

      respond_with @contact
    end
  end
end
