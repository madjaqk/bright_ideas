class UsersController < ApplicationController
	def new
		@user = User.new
		render "new"
	end

  	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			session[:user_id] = @user.id
			redirect_to "/bright_ideas"
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to "/main"
		end
  	end

  	def login
		user = User.find_by email: params[:email]
		if !user
			flash[:errors] = ["E-mail address not found"]
			redirect_to "/main"
		else
			if user.authenticate(params[:password])
				session[:user_id] = user.id.to_s
				redirect_to "/bright_ideas"
			else
				flash[:errors] = ["Incorrect password"]
				redirect_to "/main"
			end
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to "/main"
	end

	def show
		@user = User.find(params[:id])
		@idea_count = Idea.where(user: @user).count
		@like_count = Like.where(user: @user).count
	end

  	private
	def user_params
		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	end
end
