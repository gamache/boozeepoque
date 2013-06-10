#!/usr/bin/env ruby
`ls`.each_line do |f|
  puts "<li><a href=\"#\"><img src=\"/images/gallery/thumbs/#{f.chomp!}\" "+
       "data-image=\"/images/gallery/#{f}\" alt=\"#{f.gsub(".jpg","")}\"></a>"
end
