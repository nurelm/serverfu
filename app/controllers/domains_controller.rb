class DomainsController < ApplicationController

  def index
    domain = Domain.find(:all, order: 'name').first
    if domain != nil then
      redirect_to domain_url(domain)
    end
  end

  def show
    begin
      @domain = Domain.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to domains_path
    else
      @domain_clients = @domain.clients.order(:name).page params[:body_page]
      @domain_ips = @domain.ips.order(:address).page params[:body_page]
      @domain_notes = @domain.notes.order('created_at DESC').page params[:body_page]
  
      @domains = Domain.order('name').page params[:sidebar_page]
  
      @new_domain = Domain.new
    end
  end

  def create
    if get_controller_from_state == 'clients'
      @client = Client.find get_id_from_state
      #domain = @client.domains.build domain_params(:new_domain)
    else
      domain = Domain.new domain_params(:new_domain)
    end

    if domain.save
      redirect_to_state notice: (t 'success.create', thing: 'Domain')
    else
      redirect_to_state error: (t 'error.create', thing: 'Domain')
    end
  end
  
  def update
    @domain = Domain.find params[:id]
   
    respond_to do |format|
      if @domain.update_attributes(domain_params)
        format.html { redirect_to @domain,
          notice: (t 'success.update', thing: 'Domain') }
        format.json { respond_with_bip(@domain) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@domain) }
      end
    end
  end

  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    respond_to do |format|
      format.html {
        redirect_to_state notice: (t 'success.delete', thing: 'Domain') }
      format.json { head :no_content }
    end
  end

  private

  def domain_params(domain_object = :domain)
    params.require(domain_object).permit(:name)
  end


end
