class HostsController < ApplicationController
  def index
    host = Host.find(:all, order: 'name').first
    if host != nil then
      redirect_to host_url(host)
    end
  end

  def show
    @host = Host.find(params[:id])
    @hosts = Host.find(:all, order: 'name')
    @new_host = Host.new
    @new_server = Server.new
  end

  def create
    @host = Host.new host_params
    if @host.save
      redirect_to @host, notice: 'Host was successfully created.'
    else
      render action: "create"
    end
   end

  def update
    @host = Host.find(params[:id])
    if params[:new_server]
      server = @host.servers.build server_params
      if server.save
        redirect_to @host
      else
        # flash error
      end
    end
  end

  private

  def host_params
    params.require(:new_host).permit(:name)
  end

  def server_params
    params.require(:new_server).permit(:name)
  end

end
