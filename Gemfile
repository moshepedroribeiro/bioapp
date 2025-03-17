source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.2', '>= 7.2.2.1'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false
gem 'sassc-rails'
gem 'cssbundling-rails'
gem 'telegram-bot-ruby', '~> 2.1'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem 'json'
gem 'faker'
gem 'sidekiq'
gem 'redis'
gem 'rufus-scheduler'
gem 'httparty'

group :development, :test do
  gem 'capybara'
  gem 'capybara-lockstep'
  gem 'capybara-screenshot', require: false
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv-rails'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'webmock', require: 'webmock/rspec'
  gem 'parallel_tests'
  gem 'overcommit'
  gem 'bundler-audit', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
  gem 'sinatra-contrib'
  gem 'brakeman', require: false
  gem 'erb_lint', require: false
  gem 'letter_opener'
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false
  gem 'i18n-debug'

  gem 'rerun'
end

group :test do
  gem 'pdf-inspector', require: 'pdf/inspector'
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
end
