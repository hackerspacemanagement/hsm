source 'http://rubygems.org'

gem 'rails', '3.1.3'

gem 'devise'
gem 'haml', '>= 3.0.0'
gem 'haml-rails'
gem 'jquery-rails'
gem 'dynamic_form'
gem 'rack-ssl-enforcer'
gem 'rails-settings-cached', :require => 'rails-settings'
gem "paperclip", "~> 2.4"
gem 'cancan'

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
  gem 'ruby-debug19', :require => 'ruby-debug' if RUBY_VERSION >= "1.9"
  gem 'cover_me' if RUBY_VERSION >= "1.9"
  gem 'faker'
  gem 'wirble'
end

group :development do
  gem 'heroku'
end

group :test do
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'database_cleaner'
end
