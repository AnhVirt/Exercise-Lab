class AddColumnStatusTalkTypeToTalks < ActiveRecord::Migration[5.1]
  def change
  	add_column :talks,:status,:integer,default: 0
  	add_column :talks,:talk_type,:integer,default: 0
  	add_index  :talks,:talk_type
  end
end
	