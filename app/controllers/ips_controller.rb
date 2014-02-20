class IpsController < ApplicationController
  def index
    ip = Ip.find(:all, order: 'name').first
    if ip != nil then
      redirect_to ip_url(ip)
    end
  end

  def show
    begin
      @ip = Ip.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to ips_path
    else
      @ips = Ip.order('address').page params[:sidebar_page]
      @new_ip = Ip.new
    end
  end

  def create
    if get_controller_from_state == 'servers'
      @server = Server.find get_id_from_state
      ip = @server.ips.build ip_params(:new_ip)
    else
      ip = Ip.new ip_params(:new_ip)
    end

    if ip.save
      redirect_to_state notice: (t 'success.create', thing: 'Ip')
    else
      redirect_to_state error: (t 'error.create', thing: 'Ip')
    end
  end
  
  def update
    @ip = Ip.find params[:id]
   
    respond_to do |format|
      if @ip.update_attributes(ip_params)
        format.html { redirect_to @ip,
          notice: (t 'success.update', thing: 'IP') }
        format.json { respond_with_bip(@ip) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@ip) }
      end
    end
  end

  def destroy
    @ip = Ip.find(params[:id])
    if @ip.destroy
      respond_to do |format|
         format.html {
           redirect_to_state notice: (t 'success.delete', thing: 'Ip') }
         format.json { head :no_content }
       end
    end
  end

  private

  def ip_params(ip_object = :ip)
    params.require(ip_object).permit(:address)
  end

end
