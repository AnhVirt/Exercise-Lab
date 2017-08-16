class UsersController < ApplicationController

  before_action :profile, only: [:show,:friends]
  def sign_up
    
  	@account=Account.new

  	
  end

 

  def edit
      @account=Account.find( params[:id])  
  end
  def destroy
  end
  def show

    @articles= Article.includes([:account,:comments,:photos]).where(:account_id=> @profile).paginate(page: params[:page],per_page: 10)

  end

  def upload_avatar
    @account= Account.find(params[:id])
    if @account.update_attribute(:avatar,params[:account][:avatar])
      
      redirect_to :back
    else 
      
      redirect_to :back
    end
  end
  def upload_wallpaper
    @account=Account.find(params[:id])
  
    if @account.update_attribute(:wallpaper,params[:account][:wallpaper])
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
	     redirect_to :sign_in
      else

        render 'sign_up'
      end

  end
  def account_params
  	params.require(:account).permit(:first_name,:last_name, :email ,:password,:password_comfirmation)
  end


  def friends
    @friends = @profile.friends
  end

  private
  def profile
    @profile=Account.find(params[:id])
  end

 
end
