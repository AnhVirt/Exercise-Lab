class UsersController < ApplicationController

  before_action :profile
  def sign_up
    
  	@account=Account.new

  	
  end

  def index
    @account= Account.all
  end

  def edit
      @account=Account.find( params[:id])  
  end
  def destroy
  end
  def show

    @articles= @profile.articles
    
  end

  def upload_avatar
    @account= Account.find(params[:id])
    if @account.update_attribute(:avatar,params[:account][:avatar])
      
      redirect_to :back
    else 
      
      redirect_to :back
    end
  end

  def update
    @account= Account.find(params[:id])
    if @account.update(account_params)
        
        redirect_to user_path(id:@account.id)
      else
        render :show
    end
  end

  def create
  	@account = Account.new(account_params)
  	if @account.save
      flash[:success]="thanh cong"
  		redirect_to :sign_in
  	else
      flash[:danger] = 'Invalid email/password combination'
      render 'sign_up'
  	end
  end
  def account_params
  	params.require(:account).permit(:first_name,:last_name, :email ,:password)
  end




  private
  def profile
    @profile=Account.find(params[:id])
  end

 
end
