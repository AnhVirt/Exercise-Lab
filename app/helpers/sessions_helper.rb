module SessionsHelper
	def log_in(account)
		session[:account_id]=account.id
	end
	def current_account
   	 @current_account ||= Account.find_by(id: session[:account_id])
 	 end
 	 def logged_in?
  	!current_account.nil?
	end
	def admin?
		if logged_in?

			@current_account == Account.find(id:9)
		else
			false
		end	
	end
end