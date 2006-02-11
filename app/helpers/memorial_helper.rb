module MemorialHelper
  def extend_memorial_link(memorial)
    '<a href="#">extend this memorial for 10 years</a>'
  end
  
  
  def show_primary_picture(memorial, width=300)    
    source = if memorial.primary_picture.nil?
              '/images/noimage.jpg'
             else
               url_for_primary_picture(memorial.primary_picture, "image", "medium")
             end
    image_tag(source, :width => width, :class => "picture-memorial")
  end
  
  def url_for_primary_picture(object, method, suffix=nil)
    relative_path = object.send("#{method}_relative_path", suffix)
    return nil unless relative_path
    url = ""
    url << @request.relative_url_root.to_s << "/"
    url << object.send("#{method}_options")[:base_url] << "/"
    url << relative_path
  end
end
