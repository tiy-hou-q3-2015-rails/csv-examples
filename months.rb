# objective: array of months that are awesome

# lines = File.readlines("./months.csv")
#
# awesome_months = lines.select do |line|
#   line.include? "TRUE"
# end
#
# print awesome_months

require 'csv'
months = []
CSV.foreach("./months.csv", headers: true) do |row|
  months << row.to_hash
end

awesomes =  months.select {|month| month["Awesome"] == "TRUE"}

print awesomes.map {|month| month["Month Name"]}.join(", ")
