class AddPreferencesTable < ActiveRecord::Migration
  def self.up
    create_table :system_settings do |t|
      t.column :name,     :string
      t.column :value,    :text
      t.column :position, :integer
    end
  end

  def self.down
    drop_table :system_settings
  end
end
