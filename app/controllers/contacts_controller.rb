class ContactsController < ApplicationController

  def update
     @contact = Contact.find params[:id]
   
     respond_to do |format|
       if @contact.update_attributes(contact_params)
         format.html { redirect_to(@contact, :notice => 'Contact was successfully updated.') }
         format.json { respond_with_bip(@contact) }
       else
         format.html { render :action => "edit" }
         format.json { respond_with_bip(@contact) }
       end
     end
   end


  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :description)
  end

end
