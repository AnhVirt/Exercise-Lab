class RelationshipsController < ApplicationController
	before_action :request_params
	def create
				if @followed!=@follower
       		@follower.following<<@followed
       		redirect_to :back
       	end
	end
	def destroy
		@follower.following.delete(@followed)
	end
	private

	def request_params
			@followed = Account.find(params[:user_id])
			@follower = current_account
	end
end
