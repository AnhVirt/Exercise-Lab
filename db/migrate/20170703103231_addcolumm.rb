class Addcolumm < ActiveRecord::Migration[5.0]
  def change
  	add_column :photos ,:comment_id, :string
  end
end
