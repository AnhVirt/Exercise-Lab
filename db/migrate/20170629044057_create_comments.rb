class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :account_id
      t.string :article_id
    
      t.timestamps
    end
  end
end
