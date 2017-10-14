class TalksController < ApplicationController
	before_action :check_present_talk_personal,only:[:create]
	before_action :check_chater_in_talk,only:[:show]
	def index
		@talks = current_user.talks
		@talk = Talk.new
	end
	def create
		@talk = Talk.new(talk_params)
		respond_to do  |format|
			if @talk.save
				add_chaters
				format.html {redirect_to @talk}
				format.js
			else
				flash[:danger] = "Wrong"
				format.html { redirect_to talks_path }
				format.js
			end
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
		if !Talk.find(params[:id]).user_ids.include? current_user.id
			redirect_to talks_path
		end
	end


	def add_chaters
		if params[:talk][:user_ids].include?(current_user.id.to_s)
			@talk.user_ids = params[:talk][:user_ids]
		else
			@talk.user_ids = params[:talk][:user_ids]+[current_user.id]

		end
		if @talk.user_ids.count > 2
			@talk.talk_type = 1
		end
	end
	def check_present_talk_personal
		param = params[:talk][:user_ids]
		if param.size == 2
			@talk=talk_of_personal(param[1],current_user.id)[0]
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
