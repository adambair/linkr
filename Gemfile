source 'http://rubygems.org'

gem "rails"
gem 'jquery-rails'
gem 'pg'
gem 'redis'
gem 'redis-objects'
gem 'will_paginate', '~> 3.0.0'
gem 'acts-as-taggable-on'

group :development, :test do
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
  gem 'spork', '~> 0.9.0.rc'
  # gem "rb-fsevent" if RUBY_PLATFORM =~ /darwin/
  gem "guard"
  gem "guard-rspec"
  gem "guard-spork"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

group :production do
  gem 'therubyracer-heroku'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

