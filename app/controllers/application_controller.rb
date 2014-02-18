class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_show_state, only: [:show]
  before_action :set_tab_state, only: [:create, :edit, :update, :destroy]

  # Instead of calling redirect_to in create or destroy actions, calling
  # this method will go to the show method of the right controller, with
  # the right id, page, and tab params as stored in session[:view_state]
  def redirect_to_state(additional_options = {})
    redirect_options = {
      controller: session[:view_state][:controller],
      action: 'show',
      id: session[:view_state][:id] }

    if session[:view_state][:sidebar_page]
      redirect_options =
        redirect_options.merge({sidebar_page: session[:view_state][:sidebar_page]})
    end
  
    if session[:view_state][:body_page]
      redirect_options =
        redirect_options.merge({body_page: session[:view_state][:body_page]})
    end

    if session[:view_state][:current_tab]
      redirect_options =
        redirect_options.merge({current_tab: session[:view_state][:current_tab]})
    end

    redirect_to redirect_options, additional_options
  end

  def get_controller_from_state
    session[:view_state][:controller]
  end

  def get_id_from_state
    session[:view_state][:id]
  end

  private

  # Set session hash called "state" with elements called
  # controller, tab, page, and id:
  # 
  # controller - The current controller 
  # 
  # tab - The current page's tab
  # 
  # page -  The current page number used in any pagination
  def set_state(state_elements = {})
    view_state = session[:view_state] ? session[:view_state] : {}

    [:controller, :id, :sidebar_page, :body_page, :current_tab].each do |state_var|
      if state_elements[state_var] != nil
        view_state[state_var] = state_elements[state_var]
      end
    end

    session[:view_state] = view_state
  end

  # When hitting a show function, we can collect the controller, current
  # object ID and pagination page and stuff it into the view_state.
  def set_show_state
    set_state controller: params[:controller],
              id: params[:id],
              sidebar_page: params[:sidebar_page] ? params[:sidebar_page] : '1',
              body_page: params[:body_page] ? params[:body_page] : '1'
  end

  # When deleting, creating or updating we will already have everything
  # in the session view state except whatever tab we were on
  def set_tab_state
    set_state current_tab: params[:current_tab]
  end

end
