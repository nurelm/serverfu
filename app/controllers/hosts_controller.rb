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
  end

end
