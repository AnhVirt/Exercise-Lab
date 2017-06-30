class HomesController < ApplicationController

  	def index
  	
  		@article= Article.new
  		@articles=Article.all
  	end
  	
  	def create
  		@article= Article.new(article_params)
  		@article.account=current_account
  		if @article.save
  			redirect_to index_path
  		else
  			redirect_to index_path
  		end
  	end
  	def article_params
  		params.require(:article).permit(:content)
  	end
    def show
    end
end
