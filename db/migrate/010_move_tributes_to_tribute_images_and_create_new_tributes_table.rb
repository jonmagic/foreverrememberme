class MoveTributesToTributeImagesAndCreateNewTributesTable < ActiveRecord::Migration
  def self.up
    rename_table :tributes, :tribute_images
    create_table :tributes do |t|
      t.column :image_id, :integer
      t.column :name, :string
      t.column :note, :text
    end
  end

  def self.down
    drop_table :tributes
    rename_table :tribute_images, :tributes
  end
end
