module TalksHelper
	def talk_of_personal(id1,id2)
		Talk.joins("INNER JOIN chaters a ON a.talk_id = talks.id").joins("INNER JOIN chaters b ON b.talk_id = talks.id").where("a.account_id= ? and b.account_id = ? AND talk_type = 'personal'",id1,id2)
	end

end
