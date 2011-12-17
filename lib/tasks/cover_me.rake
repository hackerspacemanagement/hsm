namespace :cover_me do

  desc "Generates and opens code coverage report."
  task :report do
    require 'cover_me'
    CoverMe.complete!
  end

  task :all => %w{ rake:spec report }

  task :test do
    Rake::Task['cover_me:report'].invoke
  end

  task :spec do
    Rake::Task['cover_me:report'].invoke
  end

end
