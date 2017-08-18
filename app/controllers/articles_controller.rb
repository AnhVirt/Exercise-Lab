class ArticlesController < ApplicationController
	def new
	end
	def show 
		@article=Article.find(params[:id])
		@account=@article.account
		@comments = @article.comments
		@comment = Comment.new
		
	end
	def show_comments
		@article=Article.find(params[:id])
		@account=@article.account
		@comments = @article.comments
		@comment = Comment.new
		respond_to do |format|
			format.js
		end
	end

	def edit
		@article=Article.find(params[:id])
		respond_to do |format|
			format.html{ redirect_to articles_path}
			format.js
		end
	end
	def create
		@article= Article.new(article_params)
		@article.account=current_account
		
			respond_to  do |format|
		if @article.save	
				format.html{ redirect_to articles_path}
				format.js

		else
			
			format.js
		end
			end
	end
	def update
		@article=Article.find(params[:id])
			if @article.update(article_params)
				respond_to do |format|
					# format.json { render @article}
					format.json{ render json: @article}
					format.js
				end
				else
					render :edit
			end

	end

	def index
		@article= Article.new
		@article.photos.build
		@articles = Article.includes(:comments,:photos,:account)
	end
	def destroy
		Article.find(params[:id]).delete
		respond_to do |format|
			format.js
		end
	end
	def article_params
			params.require(:article).permit(:content, photos_attributes: [:id,:image,:phototable,:_destroy] )
		end
 
end
