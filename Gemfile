source 'http://rubygems.org'

gem 'rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'heroku'
# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  gem 'minitest'
  # Pretty printed test output
  # gem 'turn', :require => false # Don't work with autotest
  gem 'ZenTest'
  gem 'autotest-rails'
  gem 'autotest-fsevent'
  gem 'autotest-growl' # MacOSX only
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
