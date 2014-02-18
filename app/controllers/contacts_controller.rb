class ContactsController < ApplicationController

  def create
    if get_controller_from_state == 'hosts'
      @host = Host.find get_id_from_state
      contact = @host.contacts.build contact_params(:new_contact)
    elsif get_controller_from_state == 'clients'
      @client = Client.find get_id_from_state
      contact = @client.contacts.build contact_params(:new_contact)
    else
      contact = Contact.new contact_params(:new_contact)
    end

    if contact.save
      redirect_to_state notice: (t 'success.create', thing: 'Contact')
    else
      redirect_to_state error: (t 'error.create', thing: 'Contact')
    end
  end
  
  def update
    @contact = Contact.find params[:id]
   
    respond_to do |format|
      if @contact.update_attributes(contact_params)
        format.html { redirect_to @contact,
          notice: (t 'success.update', thing: 'Contact') }
        format.json { respond_with_bip(@contact) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@contact) }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      respond_to do |format|
         format.html {
           redirect_to_state notice: (t 'success.delete', thing: 'Contact') }
         format.json { head :no_content }
      end
    end
  end

  private

  def contact_params(contact_object = :contact)
    params.require(contact_object).permit(:first_name, :last_name, :description)
  end

end
