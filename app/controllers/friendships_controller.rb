class FriendshipsController < ApplicationController
	before_action :set_friend ,except:[:update]
	def create

		respond_to do |format|
			if Friendship.where("followed_id = ? AND follower_id=? OR follower_id = ? AND followed_id  = ?",current_account.id,@friend.id,current_account,@friend.id).blank? && @friend != current_account
				current_account.add_friends.create( :followed => @friend	)
				format.js
				format.json   {render json:{:status=>'success'}}
			else
				format.js
				format.json  {render json:{:status=>'failed'}}
			end
		end
	end
	def update
		@friendship=Friendship.find(params[:id])
		@friendship.status=1
		respond_to do |format|
			if @friendship.save
				format.js
			else
				format.js
			end
		end
	end
	def destroy
	end
	private
		def set_friend
			@friend = Account.find(params[:followed])
			
		end
end
