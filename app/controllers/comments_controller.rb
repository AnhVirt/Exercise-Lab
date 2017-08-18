class CommentsController < ApplicationController
	def new
			@comment=Comment.new
	end
	def create
		@comment = Comment.new(params_comment)
		if @comment.save
			respond_to do |format|
				format.js
			end
		else
			respond_to do |format|
				format.js
			end


		end
	end
	def show
	end
	def update
		@comment=Comment.find(params[:id])
 if @comment.update(params.require(:comment).permit(:content))
			redirect_to article_path(id:@comment.article_id)
		else 
			render :edit
		end
	end
	def edit
			@article = Article.find(params[:article_id])
			@comment=Comment.find(params[:id])
	end
	def destroy
		Comment.find(params[:id]).delete
		respond_to do |format|
			format.js
		end
		
	end

	private

	def params_comment
		pa = params.require(:comment).permit(:content)	
		pa[:article_id]= params[:article_id]
		
		pa[:account_id]= current_account.id

		return pa
	end

end
