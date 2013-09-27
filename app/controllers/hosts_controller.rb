class HostsController < ApplicationController
  def index
    host = Host.find(:all, order: 'name').first
    if host != nil then
      redirect_to host_url(host)
    end
  end

  def show
    @host = Host.find(params[:id])

    @host_servers = @host.servers.order(:name).page params[:servers_page]
    @host_contacts = @host.contacts.order(:last_name).page params[:contacts_page]
    @host_notes = @host.notes.order('created_at DESC').page params[:notes_page]

    @hosts = Host.order('name').page params[:hosts_page]

    @new_host = Host.new
    @new_server = Server.new
    @new_contact = Contact.new
    @new_note = Note.new
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

    if params[:new_server]
      server = @host.servers.build server_params
      if server.save
        redirect_to host_path(current_tab: 'servers'),
                    notice: (t 'success.create', thing: 'Server')
      else
        flash.now[:error] = t 'error.create', thing: 'Server'
      end
    end

    if params[:new_contact]
      contact = @host.contacts.build contact_params
      if contact.save
        redirect_to host_path(current_tab: 'contacts'),
                    notice: (t 'success.create', thing: 'Contact')
      else
        flash.now[:error] = t 'error.create', thing: 'Contact'
      end
    end

    if params[:new_note]
      note = @host.notes.build note_params
      if note.save
        redirect_to host_path(current_tab: 'notes'),
                    notice: (t 'success.create', thing: 'Note')
      else
        flash.now[:error] = t 'error.create', thing: 'Note'
      end
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
