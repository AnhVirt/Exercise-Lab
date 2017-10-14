class ArticlesController < ApplicationController
	def new
	end
	def show 
		@article=Article.find(params[:id])
		@user=@article.user
		@comments = @article.cache_comment
		@comment = Comment.new
		
	end
	def show_comments
		@article=Article.find(params[:id])
		# @user=@article.user
		@comments = @article.comments
		@comment = Comment.new
		respond_to do |format|
			format.html {redirect_to articles_path}
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
		@article.user=current_user
		
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
		@article.update_attributes!(article_params)
		respond_to do |format|
			format.js
			format.html {redirect_to articles_path}
		end	

	end
	
	def index
		@article= Article.new
		@article.photos.build
		@articles = Article.includes(:comments,:photos,:user)
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
