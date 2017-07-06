class HomesController < ApplicationController

  	def index
  	
  		@article= Article.new
  		@articles=Article.all
  	end
  	
  	
  	
end
