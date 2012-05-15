task :all => [:html, :css, :thumbs]
task :default => [:all]

task :html => [:haml, :html_includes]

task :haml => ['index.html']

task :css => ['main.css']

task :html_includes do
  final_html = []
  File.open('index.html', 'r') do |f|
    f.each do |line|
      if m = line.match(/^ \s* <!-- \s* include \s* (.+\.html) \s* --> \s* $/x)
        puts m
        File.open(m[1],'r') {|inc| final_html << inc.read }
      else
        final_html << line
      end
    end
  end
  File.open('index.html', 'w') do |f|
    final_html.each {|line| f.puts line}
  end
end

task :thumbs do
  Dir.glob('pics/*.*').each do |image|
    thumb = image.gsub(/^pics/, 'pics/thumbs')
    medium = image.gsub(/^pics/, 'pics/medium')
    unless File.exists?(thumb)
      sh "convert -define jpeg:size=150x150 '#{image}' -thumbnail 100x100^ "+
         "-gravity center -extent 100x100 '#{thumb}'"
    end
    unless File.exists?(medium)
      sh "convert '#{image}' -resize 940x940 '#{medium}'"
    end
  end
end

rule '.css' => ['.css.scss'] do |t|
  sh "scss #{t.source} #{t.name}"
end

rule '.html' => ['.html.haml'] do |t|
  sh "haml #{t.source} #{t.name}"
end


