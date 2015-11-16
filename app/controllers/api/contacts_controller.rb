module Api
  class ContactsController < Api::BaseController
    respond_to :json

    def index
      @contacts = Contact.all
      respond_with @contacts
    end
  end
end
