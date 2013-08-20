OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '171287943056603', '9a382042db6e0108d032e00c7f214f14'
end