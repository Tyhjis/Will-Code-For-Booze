source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

# Use sqlite3 as the testing and development Active Record
group :development, :test do
  gem 'sqlite3'
  # miniprofiler access to nice load time stats
  gem 'rack-mini-profiler'
end
group :test do
  gem 'rspec-rails', '~> 2.14.1'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'webmock'
end
# PostgreSQL for production Active Record
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# API-key db
gem 'rails-settings-cached'

# HTTP-requests gem
gem 'httparty'

# password gem
gem 'bcrypt-ruby', '~> 3.1.2'

# Jquery for dynamic content
gem 'jquery-turbolinks'

#use selenium for js tests
gem 'selenium-webdriver'

# database cleaner for use with selenium tests and non transactional fixtures
gem 'database_cleaner', '< 1.1.0'

# use debugger
gem 'debugger', group: [:development, :test]

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#include coveralls test coverage reporting
gem 'coveralls', require: false

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# use twitter-bootstrap
gem 'bootstrap-sass'
group :development do
  gem 'rails_layout'
end

#social share buttons
gem 'social-share-button'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
