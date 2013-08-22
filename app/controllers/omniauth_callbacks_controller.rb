class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		# raise request.env["omniauth.auth"].to_yaml
		user = User.from_omniauth(request.env["omniauth.auth"])

		if user.persisted?
			flash.notice = "Signed In, Bro!"
			sign_in_and_redirect user
		else
			session["devise.user_attributes"] = user.attributes
			flash.notice = "This didn't work :("
			redirect_to new_user_registration_url
		end
	end

	def self.new_with_session(params, session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"]) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end

	def facebook
		# You need to implement the method below in your model (e.g. app/models/user.rb)
		@user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
			set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		else
			session["devise.facebook_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end

	# alias_method :twitter, :all
end
