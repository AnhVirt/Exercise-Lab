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
		respond_to do |format|
 			if @comment.update(params.require(:comment).permit(:content))
 				format.js
			else 
				format.js
			end
		end
	end
	def edit
		@article = Article.find(params[:article_id])
		@comment=Comment.find(params[:id])
		respond_to do |format|
			format.js
		end
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
		
		pa[:user_id]= current_user.id

		return pa
	end

end
