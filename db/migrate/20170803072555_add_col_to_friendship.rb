class AddColToFriendship < ActiveRecord::Migration[5.0]
  def change
  	add_column :friendships, :follower_id,:integer
  	add_column :friendships, :followed_id,:integer
  	add_column :friendships, :status, :integer,default: 0
  	add_index :friendships,[:followed_id,:follower_id], unique: true
  end
end
