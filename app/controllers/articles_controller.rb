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
      if @article.save
        redirect_to :back
      else redirect_to :back
      end 

    
  end
  def update
  
  end

  def index
  end
  def destroy
    Article.all.find(params[:id]).delete
    redirect_to :back
  end
 
end
