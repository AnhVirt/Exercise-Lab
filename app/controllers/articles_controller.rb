class ArticlesController < ApplicationController
	def new
	end
	def show 
		@article=Article.find(params[:id])
		@account=@article.account
		@comments = @article.comments
		@newcomment = Comment.new

	end
	def edit
		@article=Article.find(params[:id])
	end
	def create
		@article= Article.new(article_params)
		@article.account=current_account
		if @article.save
			if params[:article][:images]
				params[:article][:images].each do |img|
					@article.photos.create(:image=>img)
				end
			end
			respond_to do |format|
				format.js
			end
		else
			flash[:danger] = "Nhap 1 tu bat ki"
			redirect_to articles_path
		end
	end
	def update
		@article=Article.find(params[:id])
		
			if @article.update(params.require(:article).permit(:content))
				 
					redirect_to article_path(id:@article.id)
				else
					render :edit
			end

	end

	def index
		@article= Article.new
		@articles = Article.includes(:comments,:photos,:account)
	end
	def destroy
		Article.all.find(params[:id]).delete
		redirect_to :back
	end
	def article_params
			params.require(:article).permit(:content)
		end
 
end
