class Comment < ActiveRecord::Base
  validates_presence_of [ :name, :note ]
  belongs_to :memorial
  
end
