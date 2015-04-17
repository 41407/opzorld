class AddAttachmentPhotoToEntries < ActiveRecord::Migration
  def self.up
    change_table :entries do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :entries, :photo
  end
end
