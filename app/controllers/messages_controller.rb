class MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		@message.user = current_user
		respond_to do |format|
			if @message.save
			
				format.js
			else
				format.js
			end
		end
	end
	def edit
	end
	def update
	end
	def destroy
	end

	private
	def message_params
		params.require(:message).permit(:text,:talk_id)
	end
	
end
