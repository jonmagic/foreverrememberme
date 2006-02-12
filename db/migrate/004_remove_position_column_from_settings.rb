class RemovePositionColumnFromSettings < ActiveRecord::Migration
  def self.up
    remove_column :system_settings, :position
  end

  def self.down
    add_column :system_settings, :position, :integer
  end
end
