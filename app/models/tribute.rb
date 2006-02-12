class Tribute < ActiveRecord::Base
  belongs_to :picture, :dependent => true
  attr_protected :picture_id
  validates_presence_of :picture_id
  has_and_belongs_to_many :memorials  

end
