class HostsController < ApplicationController
  def index
    host = Host.find(:all, order: 'name').first
    if host != nil then
      redirect_to host_url(host)
    end
  end

  def show
    begin
      @host = Host.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to hosts_path
    else
      @host_servers = @host.servers.order(:name).page params[:body_page]
      @host_contacts = @host.contacts.order(:last_name).page params[:body_page]
      @host_notes = @host.notes.order('created_at DESC').page params[:body_page]
  
      @hosts = Host.order('name').page params[:sidebar_page]
  
      @new_host = Host.new
      @new_server = Server.new
      @new_contact = Contact.new
      @new_note = Note.new
    end
  end

  def create
    @host = Host.new new_host_params
    if @host.save
      redirect_to @host,
        notice: (t 'success.create', thing: 'Host')
    else
      render action: "create"
    end
  end

  def update
    @host = Host.find(params[:id])

    if params[:host]
      respond_to do |format|
        if @host.update_attributes(host_params)
          format.html { redirect_to @host,
            notice: (t 'success.update', thing: 'Host') }
          format.json { respond_with_bip(@host) }
        else
          format.html { render :action => "edit" }
          format.json { respond_with_bip(@host) }
        end
      end
    end

  end

  def destroy
    @host = Host.find(params[:id])

    if @host.destroy
      redirect_to hosts_path,
        notice: (t 'success.delete', thing: @host.name)
    else
      flash.now[:error] = t 'error.create', thing: 'Note'
    end
  end


  private

  def host_params
    params.require(:host).permit(:name)
  end

  def new_host_params
    params.require(:new_host).permit(:name)
  end

  def server_params
    params.require(:new_server).permit(:name)
  end

  def contact_params
    params.require(:new_contact).permit(:description)
  end

  def note_params
    params.require(:new_note).permit(:note)
  end

end
