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

user = User.new( :email => 'ry@n.rix.si',
                 :first_name => '2011-03-28',
                 :last_name => '05:40:12.130017+0000')
user.save
user.confirm!
user.confirmation_token = 'KOASEkkoAdwmgTz1KZzW'
user.encrypted_password = 'ea79be64094683ab971c13eccf229cd3c497c5b9'
user.save

puts "Setting up default Settings"
Settings.group_name = "Hackerspace"

Rake::Task['db:permissions'].invoke
