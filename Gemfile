source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Authentication
gem 'devise'

# Authorization
gem 'cancan'

gem 'jquery-rails'
gem 'rails-settings-cached', :require => 'rails-settings'
gem "paperclip", "~> 2.4"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'compass', "~> 0.12.alpha.0"
end

group :development do
  gem 'sqlite3'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'pry'
  gem 'pry-doc'
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda'
end

group :production, :staging do#, :ci do
  gem 'pg'
  gem 'thin'
end

