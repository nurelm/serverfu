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


  private

  def server_params
    params.require(:server).permit(:name)
  end

end
