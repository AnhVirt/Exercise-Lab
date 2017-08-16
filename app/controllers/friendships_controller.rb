class FriendshipsController < ApplicationController
	before_action :set_friend
	def create

		if !current_account.friendships.include?(@friend) && @friend != current_account
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
