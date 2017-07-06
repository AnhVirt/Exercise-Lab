class AddcolumnPhoto < ActiveRecord::Migration[5.0]
  def change
  	add_column :photos, :phototable_id,:integer
  	add_column :photos, :phototable_type,:string
  end
end
