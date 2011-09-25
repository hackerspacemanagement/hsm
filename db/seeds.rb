# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Setting up default user.'
user = User.new :first_name            => 'Test',
                :last_name             => 'User',
                :email                 => 'user@test.com',
                :password              => 'password',
                :password_confirmation => 'password'

user.save rescue ActionView::Template::Error
user.save
user.confirm!

puts "User: #{ user.full_name } - #{ user.email } created and confirmed!"
