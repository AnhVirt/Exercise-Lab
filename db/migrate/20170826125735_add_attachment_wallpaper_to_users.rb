class AddAttachmentWallpaperToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :wallpaper
    end
  end

  def self.down
    remove_attachment :users, :wallpaper
  end
end
