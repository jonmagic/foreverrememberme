class AddTributeTable < ActiveRecord::Migration
  def self.up
    create_table :tributes do |t|
      t.column :picture_id, :integer
      t.column :title, :string
      t.column :description, :string
    end
  end

  def self.down
    drop_table :tributes
  end
end
