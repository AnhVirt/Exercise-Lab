class AddAttachmentWallpaperToAccounts < ActiveRecord::Migration[5.0]
  def self.up
    change_table :accounts do |t|
      t.attachment :wallpaper
    end
  end

  def self.down
    remove_attachment :accounts, :wallpaper
  end
end
