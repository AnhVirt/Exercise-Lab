module SessionsHelper
	def log_in(account)
		session[:account_id]=account.id
	end
	def current_account
		if (account_id = session[:account_id])
  			@current_account ||= Account.find_by(id: account_id)
  	
		end
 	end
 	 def logged_in?
  	!current_account.nil?
	end

 
  def log_out
  	
		session.delete(:account_id)
  	@current_account=nil
  end
end
