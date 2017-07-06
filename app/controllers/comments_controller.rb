class CommentsController < ApplicationController
	def new
			@comment= Comment.all
			@newcomment=Comment.new
	end
	def create

		@newcomment = Comment.new(params_comment)
		if @newcomment.save
			if params[:comment][:photo]

				@newcomment.create_photo(:image=>params[:comment][:photo])

			end
			
			redirect_to :back
		else
			redirect_to :back

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
		Comment.all.find(params[:id]).delete
		redirect_to :back
		
	end

	private

	def params_comment
		pa=params.require(:comment).permit(:content)	
		pa[:article_id]= params[:article_id]
	
		pa[:account_id]= current_account.id

		return pa
			end

end
