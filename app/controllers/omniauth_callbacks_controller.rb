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
			new(session["devise.user_attributes"], without_protection: true) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end

	alias_method :twitter, :all
end
