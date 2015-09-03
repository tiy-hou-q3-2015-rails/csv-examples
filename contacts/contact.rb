require 'csv'
require 'erb'

contacts = []
CSV.foreach("./us-500.csv", headers: true) do |row|
  contacts << row.to_hash
end

# texas people:
texas = contacts.select {|contact| contact["state"] == "TX"}
# print texas.map{|contact| contact["email"]}.join(", ")

# open the HMTL template
# apply the data
b = binding
template = File.read("./texas.erb")
result = ERB.new(template).result(b)

File.open("./texas.html", "wb") {|f| f << result}

texas.each do |contact|
  b = binding
  template = File.read("./contact.erb")
  result = ERB.new(template).result(b)

  filename = [contact["last_name"], contact["first_name"]].join("-").downcase

  File.open("./#{filename}.html", "wb") {|f| f << result}
end
