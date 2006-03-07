class AddCreatedAtAndActivatedAtToTributes < ActiveRecord::Migration
  def self.up
    add_column :tributes, :created_at, :timestamp
    add_column :tributes, :activated_at, :timestamp
  end

  def self.down
    remove_column :tributes, :created_at
    remove_column :tributes, :activated_at
  end
end
