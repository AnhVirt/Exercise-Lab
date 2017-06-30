class UsersController < ApplicationController
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
   @account=current_account
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
 
end
