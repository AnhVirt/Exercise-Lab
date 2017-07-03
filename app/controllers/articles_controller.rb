class ArticlesController < ApplicationController
  def new
  	@article = Article.first

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

  def update
     @article=Article.find(params[:id])
    
      if @article.update(params.require(:article).permit(:content))
      
          redirect_to article_path(id:@article.id)
        else
          render :edit
      end

  end

  def index
  end
  def destroy
    Article.all.find(params[:id]).delete
    redirect_to :back
  end
 
end
