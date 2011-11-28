namespace :db do
    desc "Sync permissions to database"
    task :permissions => :environment do
        puts 'Setting up permissions'

        permissions = [
            ['login', 'Login'],
            ['access_admin_panel', 'Access administration panel']
        ]

        permissions.each { |permData|
            perm = Permission.where(:name => permData[0]).first
            if perm
                next
            end
            permission = Permission.new :name => permData[0],
                                        :description => permData[1]
            permission.save rescue ActionView::Template::Error
            permission.save
            puts "Created permission #{ permission.name }"
        }

        puts "Permissions created!"
    end
end
