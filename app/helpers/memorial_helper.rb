module MemorialHelper
  def extend_memorial_link(memorial)
    '<a href="#">extend this memorial for 10 years</a>'
  end
  
  
  def show_memorial_image(memorial, width=300)    
    source = if memorial.image.blank? 
              '/images/noimage.jpg'
             else
               memorial.image
             end
    image_tag(source, :width => width, :class => "picture-memorial")
  end
end
