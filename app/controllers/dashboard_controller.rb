class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
    @buses = Bus.includes(:teams).all
	end
end
