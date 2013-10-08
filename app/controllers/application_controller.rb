class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_show_state, only: [:show]

  # Instead of calling redirect_to in create or destroy actions, calling
  # this method will go to the show method of the right controller, with
  # the right id, page, and tab params as stored in session[:view_state]
  def redirect_to_state

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
    view_state = session[:view_state]
    if view_state == nil
      view_state = {}
    end

    [:controller, :tab, :page, :id].each do |state_var|
      if state_elements[state_var] != nil
        view_state[state_var] = state_elements[state_var]
      end
    end

    session[:view_state] = view_state
  end

  # Set session state variable's controller, tab and page elements based 
  # on param hash.
  def set_show_state
    set_state controller: params[:controller],
              id: params[:id],
              page: ControllerUtil.extract_hash(params, "page")
  end

end
