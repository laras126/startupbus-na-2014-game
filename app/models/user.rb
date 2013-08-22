class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

    attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :name

    validates_presence_of :email
    validates_uniqueness_of :email

    def email_required?
        false
    end

    def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.username = auth.info.nickname
            user.name = auth.info.name
            user.save!
        end
    end
    
    def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
        # user = User.where(:provider => auth.provider, :uid => auth.uid).first
        
            # unless user
            #     user = User.create(name:auth.extra.raw_info.name,
            #         provider: auth.provider,
            #         uid: auth.uid,
            #         email: auth.info.email,
            #         password: Devise.friendly_token[0,20]
            #     )
        # end
        # user

        where(auth.slice(:provider, :uid)).first_or_create do |user|
            user.provider = auth.provider,
            user.uid = auth.uid,
            user.email = auth.info.email,
            user.password = Devise.friendly_token[0,20]
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
