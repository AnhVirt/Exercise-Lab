class Photo < ApplicationRecord
	belongs_to :phototable ,:polymorphic => true,optional: true

  has_attached_file :image, 

    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"
    validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/png","image/jpg"]},matches: [/png\z/, /jpe?g\z/,/jpg\z/]
  
  
end
