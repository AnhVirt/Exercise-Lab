class Photo < ApplicationRecord
	belongs_to :phototable ,:polymorphic => true

  has_attached_file :image, 

    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"
    validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/png","image/jpg"]},matches: [/png\z/, /jpe?g\z/,/jpg\z/]
  do_not_validate_attachment_file_type :image
   def save_attachments(params) 
   	params[:images].each do |image| 
   		self.photos.create(:image => image) 
   	end 
   end
end
