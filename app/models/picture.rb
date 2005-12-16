class Picture < ActiveRecord::Base
  validates_presence_of [ :image ]
  belongs_to :memorial
  file_column :image, :magick => {
      :versions => { "thumb" => "80x60", "medium" => "320x240", "large" => "800x600" }
    }
end
