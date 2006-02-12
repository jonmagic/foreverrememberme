class AddTypeColumnToSystemSettings < ActiveRecord::Migration
  def self.up
    add_column :system_settings, :type, :string
  end

  def self.down
    remove_column :system_settings, :type
  end
end
