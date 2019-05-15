class AddAttachmentImageToArticles < ActiveRecord::Migration[5.2]
  def self.up
    change_table :article do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :article, :image
  end
end
