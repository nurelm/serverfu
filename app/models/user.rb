class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
         #:registerable


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data.email).first || User.new

    if User.devise_modules.include? :registerable && user.nil?
      user = User.create(email: data.email,
             password: Devise.friendly_token[0,20],
             provider: access_token.provider,
             uid: access_token.uid
            )
    end
    user
  end
end