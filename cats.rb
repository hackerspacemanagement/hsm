
file = File.new('categories.sql')

while (txt = file.gets)
    match = txt.scan(/(\'.*?\')/)

    if match.length > 0
        string = "tool = ToolCategory.new( :name => " + match[0][0] + " )"
        puts string
        puts "tool.save rescue ActionView::Template::Error"
        puts "\n"
    end
end
