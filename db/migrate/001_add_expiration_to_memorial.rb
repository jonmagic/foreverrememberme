class AddExpirationToMemorial < ActiveRecord::Migration
  def self.up
    add_column :memorials, :expires_at, :datetime
    Memorial.reset_column_information
    Memorial.find_all.each do |m|
      m.expires_at ||= Time.now + 10.days
      m.save
    end
  end

  def self.down
    remove_column :memorials, :expires_at
  end
end
