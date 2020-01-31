class ContactController < ApplicationController

    def index
        @contact = Contact.all
    end

    def new 
        @contact = Contact.new
    end 

    def create
        @contact = Contact.new(contact_params)
        # @contact.first_name = params[:contact][:first_name]
        # @contact.last_name = params[:contact][:last_name]
        # @contact.phone = params[:contact][:phone]
        # @contact.email = params[:contact][:email]
        #Save method - returns boolean if saved properly
        if @contact.valid? && @contact.save
            redirect_to contacts_path
        else
            render :new 
        end
    end 

    def show
        @contact = Contact.find(params[:id]) 
    end 

    def edit
        @contact = Contact.find(params[:id]) 
    end 

    # def update 
    #     @contact = Contact.find(params[:id]) 
    #     @contact.update!(first_name: params[:contact][:first_name],
    #     params[:contact][:last_name], params[:contact][:phone], params[:contact][:email])
    #end 

    def update 
        @contact = Contact.find(params[:id]) 
        @contact.update!(contact_params)
        #Update method - returns boolean if saved properly
        if @contact.valid? && @contact.save
            redirect_to contacts_path
        else
            render_to :edit 
        end
    end 

    def destroy 
        Contact.destroy(params[:id]) 
        redirect_to contacts_path
    end 

    private 
    def contact_params
        params.require(:contact).permit(:first_name, :last_name, :phone, :email)
    end 
end
