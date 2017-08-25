class SessionsController < ApplicationController
	def new
		if logged_in?
			redirect_to root_path
		else

		end

	end
	
	def create
		account= Account.find_by(email: params[:session][:email].downcase)
		if account && account.authenticate(params[:session][:password])
			log_in(account)
			redirect_to root_path
		else
			flash[:danger]="Incorrect email or password"
			render :new
		end
				
	end
	def destroy
		log_out
		redirect_to root_path
	end

	
	end
