class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :products , dependent: :destroy
  has_many :bookings
  # :nullify for later, change status dependent

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          provider: access_token.provider,
          token: access_token.credentials.token,
          refresh_token: access_token.credentials.refresh_token,
          token_expiry: Time.at(access_token.credentials.expires_at),
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
          photo: data.image
        )
      end
   end
  end
end
