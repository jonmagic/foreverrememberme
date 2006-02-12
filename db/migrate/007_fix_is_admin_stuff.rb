class FixIsAdminStuff < ActiveRecord::Migration
  def self.up
    remove_column :users, :role
    add_column :users, :role, :string
  end

  def self.down
    remove_column :users, :role
    add_column :users, :role, :integer, :default => 1    
  end
end
