class UsersController < ApplicationController
	before_action :set_user,only: [:show,:friends,:edit]
	before_action :set_user_by_id,only: [:update]
	def index
		@users = User.all
	end


	def create
		@user = User.new(params_create_user)
		if @user.save
			log_in(@user)
			redirect_to root_path
		else
			render :new
		end
	end


	def show
		@articles = @user.articles.includes(:comments,:user,:photos)
	end


	def friends
		@friends = @user.friends
		@wait_friends = @user.wait_friends
	end

	def edit
		@user = current_user
	end


	def update
		if @user.update_attributes(params_update_user)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end
	protected
	def params_create_user
		params.require(:user).permit(:name,:email,:password,:password_confirmation)

	end

	def set_user
		@user = User.friendly.find(params[:id])
	end
	def set_user_by_id
		@user = User.friendly.find(params[:id])
	end
	def params_update_user
		params.require(:user).permit(:name,:user_name)
	end
end
