class ServersController < ApplicationController

  def update
    @server = Server.find params[:id]
   
    respond_to do |format|
      if @server.update_attributes(server_params)
        format.html { redirect_to(@server, :notice => 'Server was successfully updated.') }
        format.json { respond_with_bip(@server) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@server) }
      end
    end
  end

  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to_state }
      format.json { head :no_content }
    end
  end

  private

  def server_params
    params.require(:server).permit(:name)
  end

end
