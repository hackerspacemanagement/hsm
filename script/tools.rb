user_map = []
user_map[6] = 1
user_map[10] = 5
user_map[11] = 6
user_map[12] = 7
user_map[13] = 8
user_map[15] = 10
user_map[19] = 13
user_map[21] = 0
user_map[23] = 16
user_map[25] = 18
category_map = []
category_map[5] = 0
category_map[6] = 1
category_map[7] = 2
category_map[9] = 3
category_map[10] =4
category_map[11] =5
category_map[12] =6
category_map[14] =7
category_map[15] =8
category_map[16] =9
category_map[17] =10
category_map[18] =11
category_map[21] =13
category_map[22] =14
category_map[23] =15
category_map[37] =30
category_map[46] =40
category_map[48] =42
category_map[50] =43
category_map[51] =44
category_map[52] =45
category_map[53] =46

file = File.new('resources.dump')

while (txt = file.gets)
    if txt.length > 0
        # break line in to entries
        entries = txt.split('|')
        if entries.length > 1
            if entries[1].gsub('\'', '') == "Equipment" then 
                string = "tool = Tool.new( :name => '" + entries[4].gsub(/\'/, "`") + "',\n" +
                        "                 :user_id => " + user_map[entries[2].to_i].to_s + ",\n" +
                        "                 :tool_category_id => " +category_map[entries[3].to_i].to_s + ",\n" + 
                        "                 :serial_id => '" + entries[5] + "',\n" +
                        "                 :description => '" + entries[6].gsub(/\'/, "`") + "',\n" +
                        "                 :location => '" + entries[7].gsub(/\'/, '`') + "',\n" +
                        "                 :donatable => '" + entries[8] + "',\n" +
                        "                 :notes => '" + entries[13].gsub(/\\n/, "\n").gsub(/\'/, '`') + "',\n" +
                        "                 :value => '" + entries[16].gsub(/\n/,'') + "')\n"
                puts string
                puts "tool.save"
                puts "puts 'Saved tool " + entries[4].gsub(/\'/, "`") + "'"
                puts "\n"
            end
        end
    end
end
