contents = File.read("./bluth.txt")
full_lines = contents.split("\n").reject {|line| line.empty? }
rando_paragraph = full_lines.sample
sentances = rando_paragraph.split(/\?|\.|\!/)
text = sentances.sample

the_html = <<ENDHTML
<html>
  <body>
    <h1>Quotable</h1>
    #{full_lines.map{|line| "<p>#{line}</p>"}.join(" ") }
  </body>
</html>
ENDHTML

File.open("./quote.html", "wb") {|f| f << the_html }
