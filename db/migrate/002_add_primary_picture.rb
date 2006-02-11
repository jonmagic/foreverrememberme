class AddPrimaryPicture < ActiveRecord::Migration
  def self.up
    add_column :memorials, :primary_picture_id, :integer
  end

  def self.down
    remove_column :memorials, :primary_picture_id
  end
end
