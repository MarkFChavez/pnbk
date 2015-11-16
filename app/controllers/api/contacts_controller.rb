require 'csv'

module Api
  class ContactsController < Api::BaseController
    respond_to :json, :csv

    def index
      @contacts = Contact.order(created_at: :desc)
      respond_to do |format|
        format.json { render json: @contacts }
        format.csv {
          headers['Content-Disposition'] = "attachment; filename=\"phonebook\""
          headers['Content-Type'] ||= 'text/csv'
        }
      end
    end

    def show
      @contact = Contact.find(params[:id])
      respond_with :api, @contact
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.save

      respond_with :api, @contact
    end

    def update
      @contact = Contact.find(params[:id])
      @contact.update_attributes(contact_params)

      respond_with :api, @contact
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy

      respond_with :api, @contact
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :phone)
    end
  end
end
