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

puts 'Setting up default usersdb/seeds.rb.'
user = User.new :first_name            => 'Test',
                :last_name             => 'User',
                :email                 => 'user@example.com',
                :password              => 'password',
                :password_confirmation => 'password',
                :role                  => adminRole

user.save
user.confirm!

puts "User: #{ user.full_name } - #{ user.email } created and confirmed!"
