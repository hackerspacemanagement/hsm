source 'http://rubygems.org'

gem 'rails', '3.1.3'

gem 'cancan'
gem 'devise'
gem 'dynamic_form'
gem 'jquery-rails'
gem 'paperclip', "~> 2.4"
gem 'pg'
gem 'rack-ssl-enforcer'
gem 'rails-settings-cached', :require => 'rails-settings'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
end

group :production, :staging do#, :ci do
  gem 'thin'
end

group :development, :test do
  gem 'capybara'
  gem 'cover_me' if RUBY_VERSION >= "1.9"
  gem 'faker'
  gem 'rspec-rails'
  gem 'ruby-debug19', :require => 'ruby-debug' if RUBY_VERSION >= "1.9"
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
