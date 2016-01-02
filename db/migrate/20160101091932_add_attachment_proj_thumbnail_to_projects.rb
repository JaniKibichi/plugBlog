class AddAttachmentProjThumbnailToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :proj_thumbnail
    end
  end

  def self.down
    remove_attachment :projects, :proj_thumbnail
  end
end
