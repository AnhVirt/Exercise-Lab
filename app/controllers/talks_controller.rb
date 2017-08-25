class TalksController < ApplicationController
	before_action :check_present_talk_personal,only:[:create]
	before_action :check_chater_in_talk,only:[:show]
	def index
		@talks = current_account.talks
		@talk = Talk.new
	end
	def create
		@talk = Talk.new(talk_params)
		if @talk.save
			add_chaters
			redirect_to @talk
		else
			flash[:danger] = "Wrong"
			redirect_to talks_path
		end	
	end
	def show
		@talk = Talk.find(params[:id])
		@message = Message.new
		@messages = @talk.messages
	end
	def update
		@talk = Talk.update(talk_params)

	end
	def destroy
		Talk.destroy(params[:id])


	end
	private
	def talk_params
		params.require(:talk).permit(:name)
	end
	def check_chater_in_talk
		if !Talk.find(params[:id]).accounts.include? current_account
			redirect_to talks_path
		end
	end
	def add_chaters
		if params[:talk][:account_ids].include?(current_account.id.to_s)
			@talk.account_ids = params[:talk][:account_ids]
		else
			@talk.account_ids = params[:talk][:account_ids]+[current_account.id]

		end
		if @talk.accounts.count > 2
			@talk.type = 1
		end
	end
	def check_present_talk_personal
		param = params[:talk][:account_ids]
		if param.size == 2
			@talk=talk_of_personal(param[1],current_account.id)[0]
			if @talk.blank?
			else
				redirect_to @talk
			end

		else
			if param.size >2
			else
				flash[:danger]="xx"
				redirect_to talks_path
			end
		end
	end
end
