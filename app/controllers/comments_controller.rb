class CommentsController < ApplicationController
	def new
			@comment= Comment.all
			@newcomment=Comment.new
	end
	def create

		@newcomment = Comment.new(params_comment)
		if @newcomment.save

			redirect_to :back
		else
			redirect_to :back

		end
	end
	def show
	end
	def update
	end
	def edit

	end
	def destroy
		asdas
		Comment.all.find(params[:id]).delete
		redirect_to :back
		
	end

	private

	def params_comment
		pa=params.require(:comment).permit(:content)	
		pa[:article_id]= params[:article_id]
	
		pa[:account_id]= Article.find(params[:article_id]).account.id
		return pa
			end

end
