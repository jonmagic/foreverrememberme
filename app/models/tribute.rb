class Tribute < ActiveRecord::Base
  belongs_to :image, :class_name => 'TributeImage', :foreign_key => "image_id"
  belongs_to :memorial

  def self.clear_unactivated
    tribs = Tribute.find(:all, :conditions => ['created_at < ? AND activated_at IS NULL', Time.now - 3.days])
    tribs.each { |t| t.destroy }
  end
end
