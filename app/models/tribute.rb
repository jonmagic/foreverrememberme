class Tribute < ActiveRecord::Base
  belongs_to :picture, :dependent => true
end
