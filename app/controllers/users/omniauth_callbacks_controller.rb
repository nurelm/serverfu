class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        if !User.devise_modules.include? :registerable
          flash[:error] = "Someone will have to make you an account first"
          redirect_to new_user_session_url
        else
          flash[:error] = "Something went wrong look at the logs"
          redirect_to new_user_registration_url
        end
      end
  end
end
