desc "Copy third-party gems into ./lib"
task :freeze_other_gems do

  # add make sure vendor/gem-name is in the searchpath in 
  # environment.rb
  libraries = %w(money paypal)
  require 'rubygems'
  require 'find'

  libraries.each do |library|
    library_gem = Gem.cache.search(library).sort_by { |g| g.version }.last
    puts "Freezing #{library} for #{library_gem.version}..."
    
    folder_for_library = "#{library_gem.name}-#{library_gem.version}"
    system "cd vendor; gem unpack -v '#{library_gem.version}' #{library_gem.name};"
    system "cd vendor; mkdir #{library}"
    system "cd vendor; cp -r #{folder_for_library}/* #{library}/"
    system "cd vendor; rm -r #{folder_for_library}"
  end
end
