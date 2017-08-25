class AddColumnUsernameToAccount < ActiveRecord::Migration[5.1]
  def change
	    add_column :accounts, :username, :string,unique: true
  end
end
