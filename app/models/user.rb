class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

    attr_accessible :email, :password, :password_confirmation, :remember_me, :username

    validates_presence_of :username
    validates_uniqueness_of :username

    def self.from_omniauth(auth)
    	where(auth.slice(:provider, :uid)).first_or_create do |user|
    		user.provider = auth.provider
    		user.uid = auth.uid
    		user.username = auth.info.nickname
    	end
    end

    def password_required?
    	super && provider.blank?
    end

    def update_with_password(params, *options)
    	if encrypted_password.blank?
    		update_attributes(params, *options)
    	else
    		super
    	end
    end
end
