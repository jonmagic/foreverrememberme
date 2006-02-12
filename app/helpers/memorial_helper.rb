require 'paypal'
module MemorialHelper
  include Paypal::Helpers
  
  def extend_memorial_link(memorial)
    link_to 'extend this memorial for 10 years', :action => 'extend_memorial', :id => memorial.id
  end
  
  def extended_date(memorial)
    date = if memorial.expired?
              Time.now + 10.years
            else
              memorial.expires_at + 10.years
            end
    date.strftime "%B %d, %Y"
  end
  
  def show_primary_picture(memorial, width=300)    
    source = if memorial.primary_picture.nil?
              '/images/noimage.jpg'
             else
               url_for_primary_picture(memorial.primary_picture, "image", "medium")
             end
    image_tag(source, :width => width, :class => "picture-memorial")
  end
  
  def dob_to_dod(memorial)
    dob = memorial.date_of_birth.strftime "%Y" 
    dod = memorial.date_of_death.strftime "%Y"
    "#{dob} to #{dod}"
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
