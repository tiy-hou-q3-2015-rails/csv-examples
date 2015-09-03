require "erb"

# read the HTML
# apply the data to the HTML

contents = File.read("./bluth.txt")
full_lines = contents.split("\n").reject {|line| line.empty? }

tacos = "tacos are not made to be lettuce'd"

b = binding
the_html = File.read("./bluth.erb")
compiled_html = ERB.new(the_html).result(b)

puts compiled_html
