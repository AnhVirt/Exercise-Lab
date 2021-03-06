class SessionsController < ApplicationController
	def new
		if logged_in?
			redirect_to users_path
		end
	end
	def show
	end
	def create
		account= Account.find_by(email: params[:session][:email].downcase)
		if account && account.authenticate(params[:session][:password])
			log_in(account)
			flash[:success] = " Has Log in"
			redirect_to root_path
			else
				
				redirect_to sign_in_path
			end
				
	end
	def destroy
		log_out
		redirect_to root_path
	end

	
	end
