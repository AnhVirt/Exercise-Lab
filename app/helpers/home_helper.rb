module HomeHelper
	def user_id (id)
		user.find_by(id: id).name
	end
end
