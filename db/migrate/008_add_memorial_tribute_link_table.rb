class AddMemorialTributeLinkTable < ActiveRecord::Migration
  def self.up
    create_table :memorials_tributes do |t|
      t.column :memorial_id, :integer
      t.column :tribute_id, :integer
      t.column :created_at, :datetime      
    end
  end

  def self.down
    drop_table :memorials_tributes
  end
end
