class UsersController < ApplicationController
	before_action :authenticate_user!

	def me
		@user = current_user
		render :show
	end
end
