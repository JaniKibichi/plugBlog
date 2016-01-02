class Post < ActiveRecord::Base
 belongs_to :user

 extend FriendlyId
 friendly_id :title, use: :slugged

  has_attached_file :plug_thumbnail, styles: { large: "640x480#",medium: "480x360#", thumb: "100x100#" }
  validates_attachment_content_type :plug_thumbnail, content_type: /\Aimage\/.*\Z/



end
