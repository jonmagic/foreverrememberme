class AddFeedbackTable < ActiveRecord::Migration
  def self.up
    create_table :feedback do |t|
      t.column :email, :string
      t.column :message, :text      
    end
  end

  def self.down
    drop_table :feedback
  end
end
