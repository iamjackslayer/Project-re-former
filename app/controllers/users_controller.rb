class UsersController < ApplicationController
	def index
	end
	def new
		@user = User.new
	end

	def create
		#@user = User.new(username: params[:username], email: params[:email], password: params[:email])
		@user = User.new(user_params)
		if @user.save
			redirect_to new_user_path
		end
		errors = @user.errors.full_messages
		render :new, locals: {errors: errors}
		
	end

	def edit
		if !(@user = User.find(params[:id]))
			render edit
		end
	end

	def update
		@user = User.find(params[:id])
		@user.email = params[:email]
		@user.username = params[:username]
		@user.password = params[:password]

		redirect_to new_user_path
	end

	def user_params
		params.require(:user).permit(:username,:email,:password)
	end
end
