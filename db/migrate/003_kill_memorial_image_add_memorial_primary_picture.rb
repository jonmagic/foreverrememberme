class KillMemorialImageAddMemorialPrimaryPicture < ActiveRecord::Migration
  def self.up
    remove_column :memorials, :image
    add_column :memorials, :primary_picture_id, :integar
  end

  def self.down
    remove_column :memorials, :primary_picture_id
    add_column :memorials, :image, :string
  end
end
