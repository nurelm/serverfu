class ClientsController < ApplicationController
  def index
    client = Client.find(:all, order: 'name').first
    if client != nil then
      redirect_to client_url(client)
    end
  end

  def show
    @client = Client.find(params[:id])

    @client_clients = @client.clients.order(:name).page params[:body_page]
    @client_contacts = @client.contacts.order(:last_name).page params[:body_page]
    @client_notes = @client.notes.order('created_at DESC').page params[:body_page]

    @clients = Client.order('name').page params[:sidebar_page]

    @new_client = Client.new
  end

  def create
    if get_controller_from_state == 'servers'
      @server = Server.find get_id_from_state
      client = @server.clients.build client_params(:new_client)
    else
      client = Client.new client_params(:new_client)
    end

    if client.save
      redirect_to_state notice: (t 'success.create', thing: 'Client')
    else
      redirect_to_state error: (t 'error.create', thing: 'Client')
    end
  end
  
  def update
    @client = Client.find params[:id]
   
    respond_to do |format|
      if @client.update_attributes(client_params)
        format.html { redirect_to @client,
          notice: (t 'success.update', thing: 'Client') }
        format.json { respond_with_bip(@client) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@client) }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      respond_to do |format|
         format.html {
           redirect_to_state notice: (t 'success.delete', thing: 'Client') }
         format.json { head :no_content }
       end
    end
  end

  private

  def client_params(client_object = :client)
    params.require(client_object).permit(:name)
  end
end
