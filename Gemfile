source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'devise'
gem 'haml', '>= 3.0.0'
gem 'haml-rails'
gem 'jquery-rails'
gem 'dynamic_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :production, :staging do#, :ci do
  gem 'pg'
  gem 'thin'
end

group :development, :test do
  gem 'sqlite3'
  gem 'capybara'
  gem 'rspec-rails', '>= 2.0.1'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'cover_me'
  gem 'wirble'
end

group :development do
  gem 'heroku'
end

group :test do
  gem 'factory_girl_rails'
  gem 'launchy'
end
