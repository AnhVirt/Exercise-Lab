class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
    	t.integer  :follower_id
  		t.integer :followed_id
  		t.integer :status, :integer,default: 0
      t.timestamps
    end
  	add_index :friendships,[:followed_id,:follower_id], unique: true
  end
end
