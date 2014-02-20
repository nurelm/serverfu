class SitesController < ApplicationController
  def index
    site = Site.find(:all, order: 'description').first
    if site != nil then
      redirect_to site_url(site)
    end
  end

  def show
    begin
      @site = Site.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to sites_path
    else
      @site_domains = @site.domains.order(:name).page params[:body_page]
      @site_notes = @site.notes.order('created_at DESC').page params[:body_page]
      @site_credentials = @site.credentials.order(:description).page params[:body_page]
  
      @sites = Site.order('description').page params[:sidebar_page]
  
      @new_site = Site.new
    end
  end

  def create
    if get_controller_from_state == 'clients'
      @client = Client.find get_id_from_state
      site = @client.sites.build site_params(:new_site)
      logger.debug "HAAERRR"
    else
      site = Site.new site_params(:new_site)
    end

    if site.save
      redirect_to_state notice: (t 'success.create', thing: 'Site')
    else
      redirect_to_state error: (t 'error.create', thing: 'Site')
    end
  end
  
  def update
    @site = Site.find params[:id]
   
    respond_to do |format|
      if @site.update_attributes(site_params)
        format.html { redirect_to @site,
          notice: (t 'success.update', thing: 'Site') }
        format.json { respond_with_bip(@site) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@site) }
      end
    end
  end

  def destroy
    @site = Site.find(params[:id])
    if @site.destroy
      respond_to do |format|
         format.html {
           redirect_to_state notice: (t 'success.delete', thing: 'Site') }
         format.json { head :no_content }
       end
    end
  end

  private

  def site_params(site_object = :site)
    params.require(site_object).permit(:description, :ip_id)
  end
end
