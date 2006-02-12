module LinkAndUrlHelper
	def url_for_memorial(memorial)
	  url_for :controller => "memorial", :action => "show", :id => "#{memorial.id}-#{memorial.firstname}-#{memorial.lastname}"
	end
	def link_to_memorial(text, memorial, options={})
	  link_to text, url_for_memorial(memorial), options
	end
end