require 'erb'
require 'csv'

# 1. read the HTML
# 2. apply the data

months = []
CSV.foreach("./months.csv", headers: true) do |row|
  months << row.to_hash
end


b = binding
html = File.read("./months.erb")
the_html = ERB.new(html).result(b)

puts the_html
