class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :articles_id
      t.string :account_id
      t.timestamps
    end
  end
end
