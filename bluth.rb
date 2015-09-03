contents = File.read("./bluth.txt")
full_lines = contents.split("\n").reject {|line| line.empty? }
rando_paragraph = full_lines.sample

# sentances = rando_paragraph.split(".")

# sorry, http://rubular.com/r/swyC4Yrojh
sentances = rando_paragraph.split(/\?|\.|\!/)
text = sentances.sample

# write to a file, quote.txt

File.open("./quote.txt", "wb") {|f| f << text }

# File.open("./quote.txt", "wb") {|f| f.write text }

# file = File.open("./quote.text")
# file.write text
# file.close
