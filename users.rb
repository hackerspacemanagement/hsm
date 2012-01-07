
file = File.new('users.sql')

while (txt = file.gets)
    match = txt.scan(/(\'.*?\')/)

    if match.length > 0
        if match[11]
            name = match[11][0].split(" ")
            if !name[1]
                name[1] = "'"
                name[0] = name[0].gsub(/\'$/, "")
            end
        else
            name = ["'first", "last'"]
        end
        string = "user = User.new( :email => " + match[0][0] + ",\n" +
                 "                 :first_name => " + name[0] + "',\n" +
                 "                 :last_name => '" + name[1] + ")\n"
        # string = "tool = ToolCategory.new( :name => " + match[0][0] + " )"
        # puts string
        # puts "tool.save rescue ActionView::Template::Error"
        # puts match << "\n"
        puts string
        puts "user.save"
        puts "user.confirm!"
        
        puts "user.confirmation_token = " + match[2][0]
        puts "user.encrypted_password = " + match[1][0]
        puts "user.save"
        puts "\n"
    end
end
