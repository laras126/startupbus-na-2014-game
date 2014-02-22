class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
    belongs_to :team
    
	devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

    attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :name

    #validates_presence_of :email
    validates_uniqueness_of :email

    def email_required?
        false
    end

    def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.save!
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
