class SetMemorialViewsToZero < ActiveRecord::Migration
  def self.up
      change_column_default :memorials, :views, '0'
  end

  def self.down
  end
end
