class CreateChaters < ActiveRecord::Migration[5.1]
  def change
    create_table :chaters do |t|
    	t.integer :account_id
    	t.integer :talk_id
      t.timestamps
    end
      add_index :chaters,[:account_id,:talk_id],unique: true
  end
end
