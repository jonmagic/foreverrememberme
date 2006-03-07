class DropMemorialTributeTableAndAddMemorialIdToTribute < ActiveRecord::Migration
  def self.up
    drop_table :memorials_tributes
    add_column :tributes, :memorial_id, :integer
  end

  def self.down
    remove_column :tributes, :memorial_id
    create_table :memorials_tributes do |t|
      t.column :memorial_id, :integer
      t.column :tribute_id, :integer
      t.column :created_at, :datetime      
    end
  end
end
