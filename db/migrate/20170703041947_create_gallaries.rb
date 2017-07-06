class CreateGallaries < ActiveRecord::Migration[5.0]
  def change
    change_table :gallaries do |t|
    	t.string :name
      t.string :description
      t.integer :cover
      t.string :token
      t.string :account_id
      t.string :article_id
    end
  end
end
