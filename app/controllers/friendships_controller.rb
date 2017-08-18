class FriendshipsController < ApplicationController
	before_action :set_friend
	def create

		if Friendship.where("followed_id = ? AND follower_id=? OR follower_id = ? AND followed_id  = ?",current_account.id,@friend.id,current_account,@friend.id).blank? && @friend != current_account
			current_account.add_friends.create( :followed => @friend	)
			render :json => {:status=>'success'}
		else
			render :json => {:status=>'failed'}
		end
	end
	def update
	end
	def destroy
	end
	private
		def set_friend
			@friend = Account.find(params[:followed])
			
		end
end
