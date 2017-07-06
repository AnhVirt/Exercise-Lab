class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
    	t.string :title
    	t.string :gallary_id
    	t.string :gallary_token
    	t.string :image
      t.timestamps
    end
  end
end
