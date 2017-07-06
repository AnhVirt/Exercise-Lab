class HomesController < ApplicationController

  	def index
  	
  		@article= Article.new
  		@articles=Article.all
  		if logged_in?
  			@profile= current_account
  		end
  	end
  	
  	
  	
end
