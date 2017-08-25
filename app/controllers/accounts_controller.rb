class AccountsController < ApplicationController
  before_action :set_account, except: [:sign_up,:create,:update]
  before_action :set_account_by_id,only: [:update]
  def sign_up
    @account=Account.new
  end

  def create
  	@account = Account.new(account_params)
    @account.username = set_username
    if @account.save
     redirect_to :sign_in
    else
      render 'sign_up'
    end

  end
 

  def edit
     
  end

  def show
    @articles= Article.includes([:account,:comments,:photos]).where(:account_id=> @account).paginate(page: params[:page],per_page: 10)
  end

  def upload_avatar
    if @account.update_attribute(:avatar,params[:account][:avatar])
      redirect_to :back
    else 
      redirect_to :back
    end
  end
  def index
    @accounts = Account.all
  end
  def upload_wallpaper
    if @account.update_attribute(:wallpaper,params[:account][:wallpaper])
      redirect_to :back
    else 
      redirect_to :back
    end
  end

  def update
    if @account.update(account_update_params)
        redirect_to account_path(username:@account.username)
      else
        render :edit
    end
  end


  def destroy
  end

  def friends
    @friends = @account.friends
    @wait_friends =@account.wait_friends
  end

  private
  def account_params
    params.require(:account).permit(:first_name,:last_name, :email ,:password,:password_confirmation)
  end
  def account_update_params
    params.require(:account).permit(:first_name,:last_name,:username)
  end
  def set_account

    @account=Account.find_by_username(params[:username])
  end
  def set_account_by_id
    @account = Account.find(params[:username])
  end
  def set_username
    begin
    user_name=SecureRandom.urlsafe_base64(10)
    end while  !Account.find_by_username(user_name).blank?
    user_name
  end
 


end
