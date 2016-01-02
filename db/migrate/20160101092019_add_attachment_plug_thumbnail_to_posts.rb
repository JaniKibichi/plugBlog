class AddAttachmentPlugThumbnailToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :plug_thumbnail
    end
  end

  def self.down
    remove_attachment :posts, :plug_thumbnail
  end
end
