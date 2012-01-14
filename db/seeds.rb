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
role = Role.new :name => 'Administrator',
                :description => 'Administrators have absolute power and inherently have all roles',
                :permissions => [Permission.where(:name => 'administrate').first]
                
role.save rescue ActionView::Template::Error
role.save
puts "Role: #{ role.name } created!"

puts 'Setting up user role.'
role = Role.new :name => 'User',
                :description => 'Users may login',
                :permissions => [Permission.where(:name => 'login').first]
                
role.save rescue ActionView::Template::Error
role.save
puts "Role: #{ role.name } created!"

Settings.new_user_role = role.id

puts 'Setting up default usersdb/seeds.rb.'
user = User.new :first_name            => 'Test',
                :last_name             => 'User',
                :email                 => 'user@example.com',
                :password              => 'password',
                :password_confirmation => 'password',
                :role                  => role

user.save rescue ActionView::Template::Error
user.save
user.confirm!

puts "User: #{ user.full_name } - #{ user.email } created and confirmed!"

puts "Setting up default skills"
skill = Skill.new :name                => 'HSM Hacking',
                  :description         => 'Hacking on the Hackerspace Management Application',
                  :more_info_url       => 'http://github.com/rrix/hsm'

skill.save rescue ActionView::Template::Error
skill.save

puts "Skill: #{ skill.name } created!"
