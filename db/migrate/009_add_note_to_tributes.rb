class AddNoteToTributes < ActiveRecord::Migration
  def self.up
    add_column :memorials_tributes, :note, :text
  end

  def self.down
    remove_column :memorials_tributes, :note
  end
end
