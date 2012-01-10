# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Setting up permissions.'
Rake::Task['db:permissions'].invoke

puts 'Setting up administrator role.'
adminRole = Role.new :name => 'Administrator',
                :description => 'Administrators have absolute power and inherently have all roles',
                :permissions => [Permission.where(:name => 'administrate').first]
                
adminRole.save
puts "Role: #{ adminRole.name } created!"

puts 'Setting up user role.'
role = Role.new :name => 'User',
                :description => 'Users may login',
                :permissions => [Permission.where(:name => 'login').first]
                
role.save
puts "Role: #{ role.name } created!"

tool = ToolCategory.new( :name => 'Woodworking Tools' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Measuring Tools' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Metalworking Tools' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Power Tool (other)' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Electronics Tools' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Hand Tool (other)' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Containers and Transportation' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Automotive Tools' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Pneumatic Tools (other)' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Flammable Gas Tools (other)' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Fastening & Joining Tools' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Rapid Prototyping Tools & Equipment' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Computer & Networking Tools' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Electronics (other)' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Electronics Supplies' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Fasteners & Supplies' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Fabric & Textiles' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Other' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Books & Resources' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Computer & Networking Devices' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Lighting' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Locks & Picks' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Clamps' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Safety' )
tool.save rescue ActionView::Template::Error

tool = ToolCategory.new( :name => 'Cutting Tools' )
tool.save rescue ActionView::Template::Error

user = User.new( :email => 'bradley.will@gmail.com',
                 :first_name => 'Will',
                 :last_name => 'Bradley',
                 :role => role)
user.save
user.confirm!
user.confirmation_token = 'IdJ1jRjj7yul9rOsoSj1'
user.encrypted_password = 'a5ca38b4dbab5a16a7b47df67a727d6d3bd95d9e'
user.save

user = User.new( :email => 'will@zyphon.com',
                 :first_name => 'will',
                 :last_name => 'bradley')
user.save
user.confirm!
user.confirmation_token = 'tWd6Lc8kGbj6fKwy9sPi'
user.encrypted_password = '956fa3ba1d7ec7eabfd3e83402758f658378d8af'
user.save

user = User.new( :email => 'wbradley@trilliumresidential.com',
                 :first_name => 'Wheel',
                 :last_name => 'Breedly')
user.save
user.confirm!
user.confirmation_token = 'jSsMT9MkORV3rUcFBpOm'
user.encrypted_password = 'e9b3ff7bdeb3f9f2e61ccd4f0e8d327eb00aa9b6'
user.save

user = User.new( :email => 'ricko@heatsynclabs.org',
                 :first_name => 'Rick',
                 :last_name => 'Osgood')
user.save
user.confirm!
user.confirmation_token = 'jjm6u59nD3LHfV6VoqQj'
user.encrypted_password = 'e419d50a96d2a9bb4ae260a69926fad66628339d'
user.save

user = User.new( :email => 'huertanix@heatsynclabs.org',
                 :first_name => 'David',
                 :last_name => 'Huerta')
user.save
user.confirm!
user.confirmation_token = 'lPF4t2jSGiy6ylX9jpwW'
user.encrypted_password = 'c41f536b31afdbec24fa494ae9aa0313e0b6e8c3'
user.save

user = User.new( :email => 'myself@vincentprime.com',
                 :first_name => 'Vincent',
                 :last_name => '')
user.save
user.confirm!
user.confirmation_token = '4qkDNH-wLSVBZo0Jegf8'
user.encrypted_password = 'cafae7ee83f5159d98838fa292414b06b7e592e0'
user.save

user = User.new( :email => 'justin.benore@gmail.com',
                 :first_name => 'Justin',
                 :last_name => '')
user.save
user.confirm!
user.confirmation_token = 'f0zPXIIXGfmXBSc_WkQS'
user.encrypted_password = '52294878a2264f272b9a9abc67ae93ae3b6dedda'
user.save

user = User.new( :email => 'nebarotype@gmail.com',
                 :first_name => 'Jasper',
                 :last_name => 'Nance')
user.save
user.confirm!
user.confirmation_token = '4x1rmf-34h0dnrkYs8gt'
user.encrypted_password = '040a20d3d977edae1938ce02f75bff6a2e44fd23'
user.save

user = User.new( :email => 'mattshepard@gmail.com',
                 :first_name => 'Matt',
                 :last_name => 'Shepard')
user.save
user.confirm!
user.confirmation_token = 'LMSle1G_BxLvbeFQ7lOI'
user.encrypted_password = '449f4e88a2fe8bb9f337357bc9e78babefcfe131'
user.save

user = User.new( :email => 'nplamondon@gmail.com',
                 :first_name => 'Nate',
                 :last_name => 'Plamondon')
user.save
user.confirm!
user.confirmation_token = 'tnd5521yhy8HuQnpDV2z'
user.encrypted_password = '4e3c01d4d247369325901d6ec685a3aa403b0989'
user.save

user = User.new( :email => 'prescott@heatsynclabs.org',
                 :first_name => 'Prescott',
                 :last_name => 'Ogden')
user.save
user.confirm!
user.confirmation_token = '8iwNrkPTaggrREkU-Ef1'
user.encrypted_password = '76452e8ac6e004fbc64ee6807dca67a21e21169f'
user.save

user = User.new( :email => 'nate@heatsynclabs.org',
                 :first_name => 'Nate',
                 :last_name => 'Caine')
user.save
user.confirm!
user.confirmation_token = 'XfK46KmHzJ0jA24r-rpM'
user.encrypted_password = '1bec73c31630c4e3386b5ad435800e33478a6680'
user.save

user = User.new( :email => 'ry@n.rix.si',
                 :first_name => 'Ryan',
                 :last_name => 'Rix',
                 :role => role)
user.save
user.confirm!
user.confirmation_token = 'KOASEkkoAdwmgTz1KZzW'
user.encrypted_password = 'ea79be64094683ab971c13eccf229cd3c497c5b9'
user.save

user = User.new( :email => 'will@heatsynclabs.org',
                 :first_name => 'Will',
                 :last_name => 'Bradley')
user.save
user.confirm!
user.confirmation_token = 'J1cFkZ6hFpM9rR6mi5vQ'
user.encrypted_password = '008a3fa1122fc83a000c232a9741fecf8786788e'
user.save

user = User.new( :email => 'tank@netblues.org',
                 :first_name => 'first',
                 :last_name => 'last')
user.save
user.confirm!
user.confirmation_token = 'dK7pYVKgVJIWyrySeoWp'
user.encrypted_password = '0eaec9894147b889a8042d54482007232b29fae8'
user.save

user = User.new( :email => 'zapking2001@yahoo.com',
                 :first_name => 'Austin',
                 :last_name => 'kipp')
user.save
user.confirm!
user.confirmation_token = 'jU1V2JYS255vPS1YEID3'
user.encrypted_password = '1cf4eb0f612a588d6e6f381e978d67e816ad347a'
user.save

user = User.new( :email => 'rb@tradica.com',
                 :first_name => 'Robert',
                 :last_name => 'Bell')
user.save
user.confirm!
user.confirmation_token = 'aAIXAH-8UXyz0DXpjjh_'
user.encrypted_password = '080ef695726139d7576643f50bcadfd92972ccf9'
user.save

user = User.new( :email => 'onelonelyecho@gmail.com',
                 :first_name => 'Jadis',
                 :last_name => 'Argiope')
user.save
user.confirm!
user.confirmation_token = '2EL66nVVB33MtWTR0jfY'
user.encrypted_password = '0ec01af783b6d935d036efe5734e6671f1d25ea7'
user.save

user = User.new( :email => 'arizonamarita@gmail.com',
                 :first_name => 'Marita',
                 :last_name => 'Ogden')
user.save
user.confirm!
user.confirmation_token = 'A2xo5XRWNsYWtCeDQoBw'
user.encrypted_password = 'a612ff1f06d43786c9f4019abff67b5097b6408e'
user.save

user = User.new( :email => '5footerica@gmail.com',
                 :first_name => 'Erica',
                 :last_name => 'Weems')
user.save
user.confirm!
user.confirmation_token = '_QhYz0GbdSNeD9a1CdWb'
user.encrypted_password = '3d4b80a7d0e84c80fca90af00d657218c80c0240'
user.save

user = User.new( :email => 'natecaine@hotmail.com',
                 :first_name => 'Nate',
                 :last_name => 'Caine')
user.save
user.confirm!
user.confirmation_token = 'iyxX70juIPFuOP7jL2bO'
user.encrypted_password = 'dfde1d2767cfefe0fb2df6f43bffc1abbf1bf5b4'
user.save

tool = Tool.new( :name => 'Screwdriver (short)',
                 :user_id => 1,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => 'Picquic Stubby, with Phillips P1 P2 P3, Flat-head 1/4 3/16, Torx T15',
                 :location => 'Will`s toolbox',
                 :donatable => 'f',
                 :notes => 'My green stubby screwdriver with bits: Phillips P1 P2 P3, Flat-head 1/4 3/16, Torx T15',
                 :value => '')
tool.save
puts 'Saved tool Screwdriver (short)'

tool = Tool.new( :name => 'Digital Calipers',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => '6" max, plastic',
                 :location => 'Will`s toolbox',
                 :donatable => 'f',
                 :notes => 'Please ask before using.',
                 :value => '$8')
tool.save
puts 'Saved tool Digital Calipers'

tool = Tool.new( :name => 'Rubber Mallet',
                 :user_id => 6,
                 :tool_category_id => 0,
                 :serial_id => '',
                 :description => '1lb',
                 :location => 'Vincent`s Apartment',
                 :donatable => 't',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Rubber Mallet'

tool = Tool.new( :name => 'Coax Crimpers',
                 :user_id => 6,
                 :tool_category_id => 0,
                 :serial_id => '',
                 :description => 'RG 59 & RG 6',
                 :location => 'Vincent`s Apartment',
                 :donatable => 't',
                 :notes => 'Cheap bottom line crimpers, but the do the job fine however.',
                 :value => '')
tool.save
puts 'Saved tool Coax Crimpers'

tool = Tool.new( :name => 'Coax Strippers',
                 :user_id => 6,
                 :tool_category_id => 0,
                 :serial_id => '',
                 :description => 'RG 59 & RG 6',
                 :location => 'Vincent`s Apartment',
                 :donatable => 't',
                 :notes => 'Cheap bottom line radioshack parts, but they work great if you know how to use them.',
                 :value => '')
tool.save
puts 'Saved tool Coax Strippers'

tool = Tool.new( :name => 'Cutting/Welding Torch',
                 :user_id => 6,
                 :tool_category_id => 0,
                 :serial_id => '',
                 :description => 'MAPP & O2',
                 :location => 'Vincent`s Apartment',
                 :donatable => 'f',
                 :notes => 'Currently in Tucson, can be provided upon request.',
                 :value => '')
tool.save
puts 'Saved tool Cutting/Welding Torch'

tool = Tool.new( :name => 'Multi-Function Oscillating Power Tool',
                 :user_id => 6,
                 :tool_category_id => 0,
                 :serial_id => '',
                 :description => 'Saw, Grinder, Sander, and Scraper',
                 :location => 'Vincent`s Apartment',
                 :donatable => 'f',
                 :notes => 'It`s sort of like a jigsaw sex toy, and after you use it you`d agree it`s one of the greatest small power tools invented. ',
                 :value => '')
tool.save
puts 'Saved tool Multi-Function Oscillating Power Tool'

tool = Tool.new( :name => 'Weak-Ass Air Pump',
                 :user_id => 6,
                 :tool_category_id => 9,
                 :serial_id => '',
                 :description => '12v DC, pumps up to weak PSI',
                 :location => 'Vincent`s Apartment',
                 :donatable => 't',
                 :notes => 'Meant to pump up car tires, but the motor isn`t powerful enough. May be suitable for bike tires, or other small projects.',
                 :value => '')
tool.save
puts 'Saved tool Weak-Ass Air Pump'

tool = Tool.new( :name => 'Circular Saw',
                 :user_id => 7,
                 :tool_category_id => 1,
                 :serial_id => '',
                 :description => '',
                 :location => 'Justin`s ',
                 :donatable => 'f',
                 :notes => 'Not cordless, only one coarse blade available.',
                 :value => '')
tool.save
puts 'Saved tool Circular Saw'

tool = Tool.new( :name => 'Jigsaw',
                 :user_id => 7,
                 :tool_category_id => 1,
                 :serial_id => '',
                 :description => '',
                 :location => 'Justin`s ',
                 :donatable => 'f',
                 :notes => 'Several different blades available',
                 :value => '')
tool.save
puts 'Saved tool Jigsaw'

tool = Tool.new( :name => 'Brake bleeding kit',
                 :user_id => 7,
                 :tool_category_id => 8,
                 :serial_id => '',
                 :description => '',
                 :location => 'Justin`s ',
                 :donatable => 'f',
                 :notes => 'Contaminated with all sorts of mystery chemicals due to miscellaneous use of the hand vacuum pump',
                 :value => '')
tool.save
puts 'Saved tool Brake bleeding kit'

tool = Tool.new( :name => 'Strobe-o-scope',
                 :user_id => 7,
                 :tool_category_id => 8,
                 :serial_id => '',
                 :description => '',
                 :location => 'Justin`s',
                 :donatable => 'f',
                 :notes => 'Automotive (for adjusting timing), but may have other uses (photography, frequency, etc.)',
                 :value => '')
tool.save
puts 'Saved tool Strobe-o-scope'

tool = Tool.new( :name => 'Air ratchet',
                 :user_id => 7,
                 :tool_category_id => 9,
                 :serial_id => '',
                 :description => '~40 ft/lbs torque',
                 :location => 'Justin`s',
                 :donatable => 'f',
                 :notes => 'Not the impact type. Don`t even think of trying it on your car`s lug nuts (unless you`re filming).',
                 :value => '')
tool.save
puts 'Saved tool Air ratchet'

tool = Tool.new( :name => 'Air compressor',
                 :user_id => 7,
                 :tool_category_id => 9,
                 :serial_id => '',
                 :description => '3 gallon, ~100 psi, 1/4 HP',
                 :location => 'Justin`s',
                 :donatable => 'f',
                 :notes => 'Also in the "weak ass" category',
                 :value => '')
tool.save
puts 'Saved tool Air compressor'

tool = Tool.new( :name => 'Impact Driver',
                 :user_id => 7,
                 :tool_category_id => 6,
                 :serial_id => '',
                 :description => '',
                 :location => 'Justin`s ',
                 :donatable => 'f',
                 :notes => 'Allows you to use a hammer to try and loosen a stripped screw that has frustrated you.',
                 :value => '')
tool.save
puts 'Saved tool Impact Driver'

tool = Tool.new( :name => 'Paint sprayer',
                 :user_id => 7,
                 :tool_category_id => 9,
                 :serial_id => '',
                 :description => '',
                 :location => 'Justin`s ',
                 :donatable => 't',
                 :notes => '"If you don`t look good, we don`t look good."

Harbor Freight quality at it`s worst: The pin holding the handle to the sprayer will fall out at will. A retaining clip may fix it, should anyone decide that a Harbor Freight paint sprayer is worth the time or effort...',
                 :value => '')
tool.save
puts 'Saved tool Paint sprayer'

tool = Tool.new( :name => 'Tube Flaring tool',
                 :user_id => 7,
                 :tool_category_id => 8,
                 :serial_id => '',
                 :description => 'Double flare for smaller (brake-line sized) tubing',
                 :location => 'Justin`s ',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Tube Flaring tool'

tool = Tool.new( :name => 'Coax Crimp Tool for RG-58,59, RG-8,213',
                 :user_id => 8,
                 :tool_category_id => 6,
                 :serial_id => 'n/a',
                 :description => '',
                 :location => 'Jasper`s House',
                 :donatable => 'f',
                 :notes => 'Really useful for crimping RF connectors onto various sizes of coax. There are two sets of Jaws, one for RG-58,59 and one for RG-8,213 and possibly RG-174. ',
                 :value => '')
tool.save
puts 'Saved tool Coax Crimp Tool for RG-58,59, RG-8,213'

tool = Tool.new( :name => 'Dremel Rotary tool',
                 :user_id => 10,
                 :tool_category_id => 4,
                 :serial_id => '',
                 :description => 'Dremel 275',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Dremel Rotary tool'

tool = Tool.new( :name => 'Dremel drill press',
                 :user_id => 10,
                 :tool_category_id => 4,
                 :serial_id => '',
                 :description => 'Dremel 220-01',
                 :location => 'HSL',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Dremel drill press'

tool = Tool.new( :name => 'Milling Machine',
                 :user_id => 0,
                 :tool_category_id => 3,
                 :serial_id => 'SKU# 44991',
                 :description => 'Central Machinery 44991',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Accessories: 

- R8 Collets from 1/8" to 3/4"
- Tormach Quick Change holders (3026 1/4", 2434 3/8", 2435 drill chuck)
- Endmills, double-ended, 1/8" through 1/2", both 2-flute and 4-flute
- Second set of endmills, 1/16" through 3/8", for professional/finishing use only
- Center/edge finder (3/8")
- Clamp set
- Screwless vice
- Parallels set
- 17mm wrench for clamp set
- Adjustable wrench (TODO: buy 18mm wrench)
- Universal indicator holder (magnetic)
- Mill indicator holder (clamp)',
                 :value => '$600')
tool.save
puts 'Saved tool Milling Machine'

tool = Tool.new( :name => 'Bench Grinder',
                 :user_id => 0,
                 :tool_category_id => 4,
                 :serial_id => '35498 322010',
                 :description => 'Central Machinery 37822 (6" grinder)',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'http://www.harborfreight.com/6-inch-bench-grinder-with-gooseneck-lamp-37822.html

Light bulb: 40 W household type (sold separately)
Arbor: 1/2" with 5/8" adapter
Motor: 1/2 HP, 3450 RPM
Base size: 5" x 7"
Wheel size: 6" x 3/4" x 1/2"
Shipping Weight: 20.22 lbs.',
                 :value => '$45')
tool.save
puts 'Saved tool Bench Grinder'

tool = Tool.new( :name => 'Vice',
                 :user_id => 0,
                 :tool_category_id => 44,
                 :serial_id => 'none',
                 :description => 'Irwin 4.5"',
                 :location => 'Shop Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Vice'

tool = Tool.new( :name => 'Vice',
                 :user_id => 0,
                 :tool_category_id => 44,
                 :serial_id => '',
                 :description => 'Ace 3" clamp vice',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Light duty clamp vice',
                 :value => '')
tool.save
puts 'Saved tool Vice'

tool = Tool.new( :name => 'Quick Clamp',
                 :user_id => 0,
                 :tool_category_id => 44,
                 :serial_id => 'none',
                 :description => '12" quick clamp',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Quick Clamp'

tool = Tool.new( :name => 'Driver (Cordless)',
                 :user_id => 0,
                 :tool_category_id => 4,
                 :serial_id => '2008 38-BM',
                 :description => 'Black & Decker 18V Driver',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Model PS1800 10mm',
                 :value => '$55')
tool.save
puts 'Saved tool Driver (Cordless)'

tool = Tool.new( :name => 'Dead Blow Hammer',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => '1.5lb dead blow hammer (orange)',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => 'Non-bouncy, non-sparking hammer',
                 :value => '$25')
tool.save
puts 'Saved tool Dead Blow Hammer'

tool = Tool.new( :name => 'Rubber Mallet',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => 'Bouncy rubber mallet',
                 :value => '$6')
tool.save
puts 'Saved tool Rubber Mallet'

tool = Tool.new( :name => 'Claw Hammer',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => 'Normal wooden claw hammer',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$10')
tool.save
puts 'Saved tool Claw Hammer'

tool = Tool.new( :name => 'Claw Hammer (small)',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$10')
tool.save
puts 'Saved tool Claw Hammer (small)'

tool = Tool.new( :name => 'Coping Saw',
                 :user_id => 0,
                 :tool_category_id => 1,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$5')
tool.save
puts 'Saved tool Coping Saw'

tool = Tool.new( :name => 'Hack Saw (3)',
                 :user_id => 0,
                 :tool_category_id => 3,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Hack Saw (3)'

tool = Tool.new( :name => 'PVC Saw',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$10')
tool.save
puts 'Saved tool PVC Saw'

tool = Tool.new( :name => 'Wood Saw',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$10')
tool.save
puts 'Saved tool Wood Saw'

tool = Tool.new( :name => 'Dremel Bit Set',
                 :user_id => 0,
                 :tool_category_id => 4,
                 :serial_id => 'SKU# 080596021870',
                 :description => '150pc',
                 :location => 'Main Lab Side Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$20')
tool.save
puts 'Saved tool Dremel Bit Set'

tool = Tool.new( :name => 'Square (quick)',
                 :user_id => 0,
                 :tool_category_id => 2,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$5')
tool.save
puts 'Saved tool Square (quick)'

tool = Tool.new( :name => 'Square (rafter)',
                 :user_id => 0,
                 :tool_category_id => 2,
                 :serial_id => '35418 502009',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$5')
tool.save
puts 'Saved tool Square (rafter)'

tool = Tool.new( :name => 'Square (carpenter combination)',
                 :user_id => 0,
                 :tool_category_id => 2,
                 :serial_id => 'none',
                 :description => 'Empire',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$20')
tool.save
puts 'Saved tool Square (carpenter combination)'

tool = Tool.new( :name => 'Level (small)',
                 :user_id => 0,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$5')
tool.save
puts 'Saved tool Level (small)'

tool = Tool.new( :name => 'Level',
                 :user_id => 0,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => '',
                 :location => 'Wood Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$7')
tool.save
puts 'Saved tool Level'

tool = Tool.new( :name => 'Jigsaw (handheld)',
                 :user_id => 0,
                 :tool_category_id => 4,
                 :serial_id => 'CS0921 97849',
                 :description => 'Ryobi JS550L',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$50')
tool.save
puts 'Saved tool Jigsaw (handheld)'

tool = Tool.new( :name => 'Scroll Saw (table)',
                 :user_id => 0,
                 :tool_category_id => 1,
                 :serial_id => 'A147482',
                 :description => 'Craftsman 572.247200',
                 :location => 'Main Lab Side Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$70')
tool.save
puts 'Saved tool Scroll Saw (table)'

tool = Tool.new( :name => 'Work Lights (halogen)',
                 :user_id => 0,
                 :tool_category_id => 42,
                 :serial_id => '',
                 :description => 'Double work light w/ tripod',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'May need replacement bulbs and/or electricals',
                 :value => '$35')
tool.save
puts 'Saved tool Work Lights (halogen)'

tool = Tool.new( :name => 'Sewing Machine',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '33079645',
                 :description => 'Sears 385.15510200',
                 :location => 'Main Lab',
                 :donatable => 'f',
                 :notes => 'Needs accessories (bobbins, thread, needles)',
                 :value => '$100')
tool.save
puts 'Saved tool Sewing Machine'

tool = Tool.new( :name => 'Sewing Machine',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '28871',
                 :description => 'Shark Euro Pro 7133',
                 :location => 'Main Lab',
                 :donatable => 'f',
                 :notes => 'Owned by Ashley Morris.

Needs all accessories (feet, thread, bobbins, needles)',
                 :value => '$100')
tool.save
puts 'Saved tool Sewing Machine'

tool = Tool.new( :name => 'Vacuum Former',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => 'Nichols Electric',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$180')
tool.save
puts 'Saved tool Vacuum Former'

tool = Tool.new( :name => 'Drill Bit Set',
                 :user_id => 0,
                 :tool_category_id => 4,
                 :serial_id => 'none',
                 :description => 'Black & Decker ~100pc drill set',
                 :location => 'Main Lab Side Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$15')
tool.save
puts 'Saved tool Drill Bit Set'

tool = Tool.new( :name => 'Skilsaw',
                 :user_id => 0,
                 :tool_category_id => 4,
                 :serial_id => 'H181153',
                 :description => 'Skil 5275 7-1/4-Inch circular saw',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$50')
tool.save
puts 'Saved tool Skilsaw'

tool = Tool.new( :name => 'Air Compressor',
                 :user_id => 0,
                 :tool_category_id => 9,
                 :serial_id => 'CO-001121750',
                 :description => 'Campbell Housefield SH2100 (2gal)',
                 :location => 'Shop Work Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$100')
tool.save
puts 'Saved tool Air Compressor'

tool = Tool.new( :name => 'Rock Tumbler',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '36058 222010',
                 :description => 'Chicago Electric 67631',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$40')
tool.save
puts 'Saved tool Rock Tumbler'

tool = Tool.new( :name => 'Lathe (mini)',
                 :user_id => 0,
                 :tool_category_id => 3,
                 :serial_id => '35166 492009',
                 :description => 'Central Machinery 93212',
                 :location => 'Shop Bench',
                 :donatable => 'f',
                 :notes => 'http://www.harborfreight.com/7-inch-x-10-inch-precision-mini-lathe-93212.html?utm_medium=cse&utm_source=googlebase&hft_adv=30053&mr:trackingCode=F4730F9E-782A-E011-B31E-001B2163195C&mr:referralID=NA
\Accessories: 
- Quick change tool post
- Quick change tool holders
- Various tools',
                 :value => '$500')
tool.save
puts 'Saved tool Lathe (mini)'

tool = Tool.new( :name => 'AR.Drone Parrot - UAV',
                 :user_id => 0,
                 :tool_category_id => 14,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 't',
                 :notes => 'Having problems syncing up with iPhone app.  May be an issue with the Atheros chip on board that is acting as a Hot Spot.  Check out tear down here:

http://www.ifixit.com/Teardown/Parrot-AR-Drone-Teardown/3984/1',
                 :value => '$299.95')
tool.save
puts 'Saved tool AR.Drone Parrot - UAV'

tool = Tool.new( :name => 'Lathe (mini cnc)',
                 :user_id => 0,
                 :tool_category_id => 3,
                 :serial_id => '',
                 :description => 'Light Machine Corp',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Lathe (mini cnc)'

tool = Tool.new( :name => 'Multimeter (digital)',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '',
                 :description => 'Centech 98025',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'QTY 5',
                 :value => '$5')
tool.save
puts 'Saved tool Multimeter (digital)'

tool = Tool.new( :name => 'Soldering Iron & Station',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'none',
                 :description => 'Elenco SL-5-40 (40 watt)',
                 :location => 'Soldering Station',
                 :donatable => 'f',
                 :notes => 'QTY 3. 40W with base and replaceable tips

http://www.elenco.com/soldering.htm',
                 :value => '$35')
tool.save
puts 'Saved tool Soldering Iron & Station'

tool = Tool.new( :name => 'Soldering Iron',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '',
                 :description => 'Elenco SR-6 (40 watt)',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'QTY 6. Replaceable tips. http://www.elenco.com/soldering.htm',
                 :value => '$10')
tool.save
puts 'Saved tool Soldering Iron'

tool = Tool.new( :name => 'Robosapien',
                 :user_id => 0,
                 :tool_category_id => 14,
                 :serial_id => 'none',
                 :description => 'Version 1',
                 :location => 'Upstairs Storage',
                 :donatable => 't',
                 :notes => '',
                 :value => '$30')
tool.save
puts 'Saved tool Robosapien'

tool = Tool.new( :name => 'Heat Gun',
                 :user_id => 0,
                 :tool_category_id => 4,
                 :serial_id => 'E213728',
                 :description => 'Home Right',
                 :location => 'Main Lab Side Bench',
                 :donatable => 't',
                 :notes => 'broken',
                 :value => '$15.99')
tool.save
puts 'Saved tool Heat Gun'

tool = Tool.new( :name => 'Hot Plate',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => 'Sylvania - 1000W',
                 :location => 'HSL Bench',
                 :donatable => 't',
                 :notes => '',
                 :value => '$25')
tool.save
puts 'Saved tool Hot Plate'

tool = Tool.new( :name => 'Safety Glasses',
                 :user_id => 0,
                 :tool_category_id => 45,
                 :serial_id => 'none',
                 :description => 'North N-Vision T5650W (white)',
                 :location => 'Main Lab Side Bench',
                 :donatable => 'f',
                 :notes => 'QTY 8',
                 :value => '$6')
tool.save
puts 'Saved tool Safety Glasses'

tool = Tool.new( :name => 'Safety Overglasses',
                 :user_id => 0,
                 :tool_category_id => 45,
                 :serial_id => '',
                 :description => '3M (black)',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'QTY 10',
                 :value => '$6')
tool.save
puts 'Saved tool Safety Overglasses'

tool = Tool.new( :name => 'Safety Goggles',
                 :user_id => 0,
                 :tool_category_id => 45,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'QTY 6',
                 :value => '$6')
tool.save
puts 'Saved tool Safety Goggles'

tool = Tool.new( :name => 'Papercraft Supplies',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => '',
                 :location => '?',
                 :donatable => 'f',
                 :notes => 'Various papercrafting supplies (image not indicative.)',
                 :value => '')
tool.save
puts 'Saved tool Papercraft Supplies'

tool = Tool.new( :name => 'Green Foam (box)',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Green Foam (box)'

tool = Tool.new( :name => 'Soldering Supplies',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '',
                 :description => '',
                 :location => 'Main Lab Soldering Station',
                 :donatable => 'f',
                 :notes => 'Misc. soldering supplies',
                 :value => '')
tool.save
puts 'Saved tool Soldering Supplies'

tool = Tool.new( :name => '"Meter hookups"',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'unknown (nate plamondon, what is this?)',
                 :value => '')
tool.save
puts 'Saved tool "Meter hookups"'

tool = Tool.new( :name => 'Variable Power Supply Dev Board',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '',
                 :description => 'Circuit Specialists',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Note says "Paul Hickey"',
                 :value => '')
tool.save
puts 'Saved tool Variable Power Supply Dev Board'

tool = Tool.new( :name => 'Blinking Eyes kit',
                 :user_id => 0,
                 :tool_category_id => 14,
                 :serial_id => '',
                 :description => 'Circuit Monkey Blinking Eyes',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'QTY 9',
                 :value => '$12')
tool.save
puts 'Saved tool Blinking Eyes kit'

tool = Tool.new( :name => 'Flux bottles',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Soldering Station',
                 :donatable => 'f',
                 :notes => 'QTY 8, (Price estimate doesn`t include flux liquid which is sold separately from bottles)',
                 :value => '$1.50')
tool.save
puts 'Saved tool Flux bottles'

tool = Tool.new( :name => 'Clamp Work Lamp',
                 :user_id => 0,
                 :tool_category_id => 42,
                 :serial_id => 'none',
                 :description => 'Home Depot Hampton Bay HBP1001c',
                 :location => 'Upstairs Workbench',
                 :donatable => 'f',
                 :notes => 'QTY 2',
                 :value => '$15')
tool.save
puts 'Saved tool Clamp Work Lamp'

tool = Tool.new( :name => 'Magnet Wire',
                 :user_id => 0,
                 :tool_category_id => 15,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Main Lab Center Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Magnet Wire'

tool = Tool.new( :name => 'Lockpick Demo Stand',
                 :user_id => 0,
                 :tool_category_id => 43,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Price includes 5 locks.',
                 :value => '$100')
tool.save
puts 'Saved tool Lockpick Demo Stand'

tool = Tool.new( :name => 'Variable Inductor',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '10698',
                 :description => 'Radio Co 107j',
                 :location => 'HSL Bench (?)',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Variable Inductor'

tool = Tool.new( :name => 'Variable Inductor',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '10375',
                 :description => 'Radio Co 107L',
                 :location => 'HSL Bench (?)',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Variable Inductor'

tool = Tool.new( :name => 'AC Voltmeter (rectifier?)',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'N361-15',
                 :description => 'Westinghouse KC-24',
                 :location => 'HSL Bench (?)',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool AC Voltmeter (rectifier?)'

tool = Tool.new( :name => 'Needle Nose Pliers',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => '',
                 :description => 'Green handle',
                 :location => 'Will`s toolbox',
                 :donatable => 'f',
                 :notes => 'Please ask before using.',
                 :value => '')
tool.save
puts 'Saved tool Needle Nose Pliers'

tool = Tool.new( :name => 'Diagonal Cutters',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => '',
                 :description => 'Green handle',
                 :location => '',
                 :donatable => 'f',
                 :notes => 'Please ask before using.',
                 :value => '')
tool.save
puts 'Saved tool Diagonal Cutters'

tool = Tool.new( :name => 'Locks (assorted)',
                 :user_id => 0,
                 :tool_category_id => 43,
                 :serial_id => '',
                 :description => '',
                 :location => 'Will`s toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Locks (assorted)'

tool = Tool.new( :name => 'Work Lights (halogen)',
                 :user_id => 0,
                 :tool_category_id => 42,
                 :serial_id => 'WL250SPC-H',
                 :description => ' Stand alone work light',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'QTY 2',
                 :value => '')
tool.save
puts 'Saved tool Work Lights (halogen)'

tool = Tool.new( :name => 'Drill Press (Ace 10")',
                 :user_id => 1,
                 :tool_category_id => 1,
                 :serial_id => '08300656',
                 :description => 'Ace 10" 5-speed',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Drill Press (Ace 10")'

tool = Tool.new( :name => 'Drill Press (Chinese)',
                 :user_id => 1,
                 :tool_category_id => 1,
                 :serial_id => '036974',
                 :description => 'ZJ4113 DP5MUL',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Drill Press (Chinese)'

tool = Tool.new( :name => 'Lathe (micro)',
                 :user_id => 1,
                 :tool_category_id => 3,
                 :serial_id => '',
                 :description => 'Taig Micro Lathe II Model 4500',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Currently missing a motor and controller.',
                 :value => '')
tool.save
puts 'Saved tool Lathe (micro)'

tool = Tool.new( :name => 'LED Flashlights',
                 :user_id => 1,
                 :tool_category_id => 42,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'QTY 3, Assorted, blue red and pink,',
                 :value => '')
tool.save
puts 'Saved tool LED Flashlights'

tool = Tool.new( :name => 'Torch (propane)',
                 :user_id => 1,
                 :tool_category_id => 10,
                 :serial_id => '',
                 :description => 'Bernzomatic Fat Boy 16.92oz',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'With torch attachment (no lighter)',
                 :value => '')
tool.save
puts 'Saved tool Torch (propane)'

tool = Tool.new( :name => 'Torch (propane)',
                 :user_id => 1,
                 :tool_category_id => 10,
                 :serial_id => '',
                 :description => 'Worthington 14.1oz',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'With torch attachment and lighter',
                 :value => '')
tool.save
puts 'Saved tool Torch (propane)'

tool = Tool.new( :name => 'Scale',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Polder brand',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Takes a 9v battery',
                 :value => '')
tool.save
puts 'Saved tool Scale'

tool = Tool.new( :name => 'Thermometer (infrared)',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Cen-Tech brand',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Takes 9v battery',
                 :value => '')
tool.save
puts 'Saved tool Thermometer (infrared)'

tool = Tool.new( :name => 'Welder',
                 :user_id => 16,
                 :tool_category_id => 3,
                 :serial_id => '',
                 :description => '90 amp fulx 110v ',
                 :location => 'Heatsync',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Welder'

tool = Tool.new( :name => 'Stud Sensor',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Black & Decker',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Not fine grained, just found and not found',
                 :value => '')
tool.save
puts 'Saved tool Stud Sensor'

tool = Tool.new( :name => 'Tape Measure',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => '25` generic',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Includes centimeters and inches',
                 :value => '')
tool.save
puts 'Saved tool Tape Measure'

tool = Tool.new( :name => 'Tape Measure',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Black & Decker 10`',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Includes centimeters and inches',
                 :value => '')
tool.save
puts 'Saved tool Tape Measure'

tool = Tool.new( :name => 'Welding cart',
                 :user_id => 16,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Blue ',
                 :location => 'Heatsync',
                 :donatable => 'f',
                 :notes => 'cart for the 110v 90 amp welder',
                 :value => '')
tool.save
puts 'Saved tool Welding cart'

tool = Tool.new( :name => 'Stud Finder',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Stanley',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Has two indicators and various thickness options. Takes a 9v battery',
                 :value => '')
tool.save
puts 'Saved tool Stud Finder'

tool = Tool.new( :name => '90 Deg. clamp',
                 :user_id => 0,
                 :tool_category_id => 44,
                 :serial_id => 'none',
                 :description => 'green 90 deg.  dual camp',
                 :location => 'welding cart',
                 :donatable => 'f',
                 :notes => 'Quantity: 2',
                 :value => '')
tool.save
puts 'Saved tool 90 Deg. clamp'

tool = Tool.new( :name => 'Calculator (graphing)',
                 :user_id => 1,
                 :tool_category_id => 14,
                 :serial_id => '',
                 :description => 'TI 83',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Takes 4 AAA and a CR1616 or CR1620',
                 :value => '')
tool.save
puts 'Saved tool Calculator (graphing)'

tool = Tool.new( :name => 'Calipers (digital)',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Cen-Tech metal',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Calipers (digital)'

tool = Tool.new( :name => 'Ruler (scale)',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => '6" 15cm with drill gauge',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'In with calipers',
                 :value => '')
tool.save
puts 'Saved tool Ruler (scale)'

tool = Tool.new( :name => 'Protractor (metal w/ straight edge)',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'General Tools',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'In with calipers',
                 :value => '')
tool.save
puts 'Saved tool Protractor (metal w/ straight edge)'

tool = Tool.new( :name => 'Calipers (digital)',
                 :user_id => 1,
                 :tool_category_id => 2,
                 :serial_id => '',
                 :description => 'Pittsburgh 6" metal',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Calipers (digital)'

tool = Tool.new( :name => 'welding mask',
                 :user_id => 16,
                 :tool_category_id => 3,
                 :serial_id => '',
                 :description => 'Auto darking Black with Blue flames',
                 :location => 'welding cart',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool welding mask'

tool = Tool.new( :name => 'Torch (butane)',
                 :user_id => 1,
                 :tool_category_id => 10,
                 :serial_id => '',
                 :description => 'Master Appliance MT-51',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Torch (butane)'

tool = Tool.new( :name => 'Drill bits (masonry)',
                 :user_id => 1,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '1/8" 3/16" 1/4" 5/16" 3/8"',
                 :value => '')
tool.save
puts 'Saved tool Drill bits (masonry)'

tool = Tool.new( :name => 'Drill bits (spade)',
                 :user_id => 1,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '1/4" 5/16" 3/8" 7/16" 1/2" 9/16" 5/8" 11/16" 3/4" 13/16" 7/8" 15/16" 1" 1-1/4"',
                 :value => '')
tool.save
puts 'Saved tool Drill bits (spade)'

tool = Tool.new( :name => 'Drill bit set (TiN)',
                 :user_id => 1,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Bench',
                 :donatable => 'f',
                 :notes => 'Drill numbers 1-60, missing numbers 60, 32, 30, 4.',
                 :value => '138')
tool.save
puts 'Saved tool Drill bit set (TiN)'

tool = Tool.new( :name => 'Drill bit set',
                 :user_id => 1,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => 'Black & Decker',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Set ranging from 1/2" on down. Missing a few pieces. Black oxide coating.',
                 :value => '')
tool.save
puts 'Saved tool Drill bit set'

tool = Tool.new( :name => 'Drills (PCB drills)',
                 :user_id => 1,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Twenty drills in two boxes. Color coded, 1/8" shank.',
                 :value => '')
tool.save
puts 'Saved tool Drills (PCB drills)'

tool = Tool.new( :name => 'Bandsaw (metal cutting)',
                 :user_id => 1,
                 :tool_category_id => 4,
                 :serial_id => '',
                 :description => 'Central Machinery 93762',
                 :location => 'HeatSync',
                 :donatable => 'f',
                 :notes => 'Currently has one spare (coarse) blade.',
                 :value => '')
tool.save
puts 'Saved tool Bandsaw (metal cutting)'

tool = Tool.new( :name => 'Pallet Jack',
                 :user_id => 1,
                 :tool_category_id => 7,
                 :serial_id => '4310-35738-0028',
                 :description => 'Central Hydraulics 2.5 Ton 39939',
                 :location => 'HeatSync',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Pallet Jack'

tool = Tool.new( :name => 'Sawhorses',
                 :user_id => 1,
                 :tool_category_id => 44,
                 :serial_id => '',
                 :description => 'Task Force',
                 :location => 'HeatSync',
                 :donatable => 'f',
                 :notes => 'Pair of plastic folding sawhorses',
                 :value => '')
tool.save
puts 'Saved tool Sawhorses'

tool = Tool.new( :name => 'Lockers',
                 :user_id => 1,
                 :tool_category_id => 7,
                 :serial_id => '',
                 :description => '',
                 :location => 'HeatSync',
                 :donatable => 'f',
                 :notes => 'Two groups of three school-style lockers',
                 :value => '')
tool.save
puts 'Saved tool Lockers'

tool = Tool.new( :name => 'Chisel set (wood)',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => 'Orange generic',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Chisel set (wood)'

tool = Tool.new( :name => 'Drill bits (for countersink)',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => 'Ryobi AR1651',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Qty 2 (three bits each)',
                 :value => '')
tool.save
puts 'Saved tool Drill bits (for countersink)'

tool = Tool.new( :name => 'Razor blades',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => 'Husky & Pittsburgh',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'QTY 2 Razor blade handle',
                 :value => '')
tool.save
puts 'Saved tool Razor blades'

tool = Tool.new( :name => 'Chisel (cold)',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => '',
                 :description => 'Dasco Pro 3/8"',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Chisel (cold)'

tool = Tool.new( :name => 'X-Acto Blades',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'SKU# 05110',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool X-Acto Blades'

tool = Tool.new( :name => 'Glass Cutting Tool',
                 :user_id => 0,
                 :tool_category_id => 46,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Glass Cutting Tool'

tool = Tool.new( :name => 'Nail Punch Set',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => 'Task Force #0082696',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Nail Punch Set'

tool = Tool.new( :name => 'Box Cutters (asst`d)',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Qty 3 assorted blades',
                 :value => '')
tool.save
puts 'Saved tool Box Cutters (asst`d)'

tool = Tool.new( :name => 'Center Punch',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Center Punch'

tool = Tool.new( :name => 'Counter sink & drill set',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => 'Ryobi',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Counter sink & drill set'

tool = Tool.new( :name => 'Precision Screwdriver Set',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => 'SKU# 811187013642',
                 :description => 'Husky 471 793',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'QTY 2',
                 :value => '')
tool.save
puts 'Saved tool Precision Screwdriver Set'

tool = Tool.new( :name => 'Precision Screwdriver Set',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => 'none',
                 :description => 'Assorted incl security bits (blue)',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Precision Screwdriver Set'

tool = Tool.new( :name => 'Torx Drivers',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => 'Orange Generic',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'T10, T15, T20, T25, T30',
                 :value => '')
tool.save
puts 'Saved tool Torx Drivers'

tool = Tool.new( :name => 'Bit extension',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => '',
                 :description => 'Irwin',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Bit extension'

tool = Tool.new( :name => 'Hand Driver (cordless)',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => '0640 10215',
                 :description => 'Durofix RV332',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Hand Driver (cordless)'

tool = Tool.new( :name => 'Hand Driver (cordless)',
                 :user_id => 0,
                 :tool_category_id => 11,
                 :serial_id => 'none',
                 :description => 'Black & Decker AS600',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => 'Takes 4x AA batteries',
                 :value => '')
tool.save
puts 'Saved tool Hand Driver (cordless)'

tool = Tool.new( :name => 'Fluke 8502A/AT Desktop Digital Multmeter',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '6625012647047',
                 :description => 'Fluke 8502A/AT Desktop Digital Multmeter',
                 :location => 'Main Lab',
                 :donatable => 'f',
                 :notes => 'Has GPIB Interface
Calibration battery is removed.
Calibration board is not installed.',
                 :value => '')
tool.save
puts 'Saved tool Fluke 8502A/AT Desktop Digital Multmeter'

tool = Tool.new( :name => 'HP 8116 Pulse/Function Generator 50MHz',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '3134g11908',
                 :description => '50MHz',
                 :location => 'Main Lab',
                 :donatable => 'f',
                 :notes => 'Has GPIB Interface
Modulation BNC input is damaged',
                 :value => '')
tool.save
puts 'Saved tool HP 8116 Pulse/Function Generator 50MHz'

tool = Tool.new( :name => 'AC/DC Power Supply',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'Main Lab',
                 :donatable => 'f',
                 :notes => 'Model XP-720
fixed: +5VDC / 3A
adjustable: +15VDC / 1A
adjustable: -15VDC / 1A

AC output: 6.3, 12.6 CT AC @ 1A',
                 :value => '')
tool.save
puts 'Saved tool AC/DC Power Supply'

tool = Tool.new( :name => 'B&K 1660 DC Power Supply',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => '164-11655',
                 :description => 'Triple output DC',
                 :location => 'Main Lab',
                 :donatable => 'f',
                 :notes => 'BK precision 

0 to 30VDC / 2A adjustable
with 

0 to 30VDC / 2A tracking adjustable
-----------
combine master/slave for:

0 to 60VDC / 2A or,
0 to 30VDC / 4A
-----------
built in digital volt/current meter
',
                 :value => '')
tool.save
puts 'Saved tool B&K 1660 DC Power Supply'

tool = Tool.new( :name => 'Tek 7904 Oscilloscope Chassis',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'b280645',
                 :description => '500 MHz',
                 :location => 'Main Lab',
                 :donatable => 'f',
                 :notes => 'Tektronix
4 slot
Model 7904 500 MHz series
------------
Power Supply not working',
                 :value => '')
tool.save
puts 'Saved tool Tek 7904 Oscilloscope Chassis'

tool = Tool.new( :name => 'Oscilloscope module',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'b103057',
                 :description => 'Model 7A24',
                 :location => 'In tektronix 7904 o scope',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Oscilloscope module'

tool = Tool.new( :name => 'Oscilloscope module',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'B227561',
                 :description => '',
                 :location => 'In tektronix 7904 o scope',
                 :donatable => 'f',
                 :notes => 'Dual trace amplifier',
                 :value => '')
tool.save
puts 'Saved tool Oscilloscope module'

tool = Tool.new( :name => 'Oscilloscope module',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'B090306',
                 :description => '',
                 :location => 'In tektronix 7904 o scope',
                 :donatable => 'f',
                 :notes => 'Dual Time Base',
                 :value => '')
tool.save
puts 'Saved tool Oscilloscope module'

tool = Tool.new( :name => 'Oscilloscope module',
                 :user_id => 0,
                 :tool_category_id => 5,
                 :serial_id => 'b088755',
                 :description => '',
                 :location => 'In tektronix 7904 o scope ',
                 :donatable => 'f',
                 :notes => 'Delaying Time Base',
                 :value => '')
tool.save
puts 'Saved tool Oscilloscope module'

tool = Tool.new( :name => 'Solder gun',
                 :user_id => 16,
                 :tool_category_id => 5,
                 :serial_id => '0702',
                 :description => 'weller 140/100 watts ',
                 :location => 'Solder cart',
                 :donatable => 'f',
                 :notes => 'In It case with tips
Model 8200',
                 :value => '')
tool.save
puts 'Saved tool Solder gun'

tool = Tool.new( :name => 'Soldering Iron',
                 :user_id => 16,
                 :tool_category_id => 40,
                 :serial_id => '',
                 :description => 'ColdHeat',
                 :location => 'Solder cart',
                 :donatable => 'f',
                 :notes => 'IN Its case',
                 :value => '')
tool.save
puts 'Saved tool Soldering Iron'

tool = Tool.new( :name => 'Soldering Iron',
                 :user_id => 16,
                 :tool_category_id => 5,
                 :serial_id => '0107',
                 :description => 'weller 40w',
                 :location => 'Solder cart',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Soldering Iron'

tool = Tool.new( :name => 'Nikon D3000',
                 :user_id => 5,
                 :tool_category_id => 14,
                 :serial_id => '3019805',
                 :description => 'Takes SD cards, shoots pretty pix',
                 :location => 'HeatSync Labs',
                 :donatable => 'f',
                 :notes => 'This is the camera being used for hslphotosync.  It is beinged loaned to HeatSync Labs temporarily by huertanix.',
                 :value => '$500')
tool.save
puts 'Saved tool Nikon D3000'

tool = Tool.new( :name => 'Electrical Engineering 101',
                 :user_id => 18,
                 :tool_category_id => 40,
                 :serial_id => '',
                 :description => '',
                 :location => 'In Jadis` Possession',
                 :donatable => 'f',
                 :notes => 'I have possession of Electrical Enginering 101 and will be studying it for the next few weeks. I will return after I`ve completed it, or otherwise if someone else needs to borrow it. My telephone number is 916.817.9987. My voicemail is full, so if you can`t reach me, text me.',
                 :value => '$50-ish')
tool.save
puts 'Saved tool Electrical Engineering 101'

tool = Tool.new( :name => 'Central Machinery 12x36" Lathe, 33274',
                 :user_id => 8,
                 :tool_category_id => 3,
                 :serial_id => '',
                 :description => '12x36 bed, 2HP 220V motor. 1440RPM max',
                 :location => 'metalworking room',
                 :donatable => 'f',
                 :notes => 'http://www.harborfreight.com/garage-shop/stationary-milling-drilling/13-inch-x-40-inch-gear-head-gap-bed-metal-lathe-66164.html',
                 :value => '$750')
tool.save
puts 'Saved tool Central Machinery 12x36" Lathe, 33274'

tool = Tool.new( :name => 'Carbide Cutting Set',
                 :user_id => 8,
                 :tool_category_id => 3,
                 :serial_id => '',
                 :description => '1/2" shank, diamond shaped inserts',
                 :location => 'Lathe Supply Locker',
                 :donatable => 'f',
                 :notes => '1/2" indexable carbide cutting set for use by advanced lathe operators',
                 :value => '$150')
tool.save
puts 'Saved tool Carbide Cutting Set'

tool = Tool.new( :name => 'HP Touchpad',
                 :user_id => 13,
                 :tool_category_id => 13,
                 :serial_id => '5CL1260YX0',
                 :description => '16GB',
                 :location => 'Front Kiosk',
                 :donatable => 'f',
                 :notes => 'On long term loan to HSL for use as front kiosk/photofram',
                 :value => '100$')
tool.save
puts 'Saved tool HP Touchpad'

tool = Tool.new( :name => 'LoL Shield',
                 :user_id => 13,
                 :tool_category_id => 14,
                 :serial_id => 'n/a',
                 :description => '14/9 LED Matrix',
                 :location => 'Microcontroller area',
                 :donatable => 'f',
                 :notes => 'On long term loan to HSL for playing/nonpermanent projects',
                 :value => '30$')
tool.save
puts 'Saved tool LoL Shield'

tool = Tool.new( :name => 'Fluorescent Tubes',
                 :user_id => 0,
                 :tool_category_id => 42,
                 :serial_id => 'none',
                 :description => 'T8 48"',
                 :location => 'Upstairs storage',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Fluorescent Tubes'

tool = Tool.new( :name => 'Fluorescent Tubes',
                 :user_id => 0,
                 :tool_category_id => 42,
                 :serial_id => 'none',
                 :description => 'D2 96"',
                 :location => 'Upstairs Storage',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Fluorescent Tubes'

tool = Tool.new( :name => 'Driver Set',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => 'ifixit if145-022-1',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Driver Set'

tool = Tool.new( :name => 'Laminator',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => 'SI-I61577H',
                 :description => 'Model #H-65 Product #1701987',
                 :location => 'Soldering Station',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Laminator'

tool = Tool.new( :name => 'Toaster Oven',
                 :user_id => 0,
                 :tool_category_id => 30,
                 :serial_id => '',
                 :description => 'Black & Decker',
                 :location => 'Soldering Station',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Toaster Oven'

tool = Tool.new( :name => 'LED Flashlight',
                 :user_id => 0,
                 :tool_category_id => 42,
                 :serial_id => 'none',
                 :description => 'Harbor Freight',
                 :location => 'HS Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool LED Flashlight'

tool = Tool.new( :name => 'Socket Wrench Set',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => '',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Socket Wrench Set'

tool = Tool.new( :name => 'Socket Wrench Set',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => 'US & metric',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Socket Wrench Set'

tool = Tool.new( :name => 'Multitool',
                 :user_id => 0,
                 :tool_category_id => 6,
                 :serial_id => 'none',
                 :description => 'Husky',
                 :location => 'HSL Toolox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Multitool'

tool = Tool.new( :name => 'Multitool',
                 :user_id => 0,
                 :tool_category_id => 40,
                 :serial_id => 'none',
                 :description => 'Leatherman',
                 :location => 'HSL Toolbox',
                 :donatable => 'f',
                 :notes => '',
                 :value => '')
tool.save
puts 'Saved tool Multitool'

tool = Tool.new( :name => 'Tri-wing screwdriver',
                 :user_id => 13,
                 :tool_category_id => 6,
                 :serial_id => 'n/a',
                 :description => 'tri-wing screwdriver for use with Gameboys, etc.',
                 :location => 'drivers drawer',
                 :donatable => 'f',
                 :notes => '',
                 :value => '$5')
tool.save
puts 'Saved tool Tri-wing screwdriver'



puts "Setting up default Settings"
Settings.group_name = "Hackerspace"

Rake::Task['db:permissions'].invoke
